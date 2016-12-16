require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/stores') do
  Store.create({:name => params.fetch("store_name")})
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/brands') do
  Brand.create({:name => params.fetch("brand_name")})
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch("id"))
  @stores = Store.all
  erb(:brand)
end

get('/stores/:id') do
  @store = Store.find(params.fetch("id"))
  @stores = Store.all
  @brands = Brand.all
  erb(:store)
end

post('/brands/:id/store')do
  store = Store.find_by_name(params.fetch("store_name"))
  store.update({:brand_id => params.fetch("id")})
  store_id = store.id
  brand = Brand.find(params.fetch("id"))
  brand.update({:store_id => store_id})
  @brand = brand
  @brands = Brand.all
  @stores = @brand.stores
  erb(:brand)
end

post('/stores/:id/brand')do
  brand = Brand.find_by_name(params.fetch("brand_name"))
  brand.update({:store_id => params.fetch("id")})
  @store = Store.find(params.fetch("id"))
  @brands = @store.brands
  @stores = Store.all
  erb(:store)
end
