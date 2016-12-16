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

post('/brands/:id/store') do
  @store = Store.find_by_name(params.fetch("store_name"))
  @brand = Brand.find(params.fetch("id"))
  @store.brands.push(@brand)
  erb(:brand_success)
end

post('/stores/:id/brand') do
  @brand = Brand.find_by_name(params.fetch("brand_name"))
  @store = Store.find(params.fetch("id"))
  @brand.stores.push(@store)
  erb(:store_success)
end

get('/brands/:id/edit') do
  @brand = Brand.find(params.fetch("id"))
  erb(:brand_edit)
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch("id"))
  erb(:store_edit)
end

post('/stores/:id') do
  store = Store.find(params.fetch("id"))
  store_name = params.fetch("store_name")
  store.update({:name => store_name})
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/brands/:id') do
  brand = Brand.find(params.fetch("id"))
  brand_name = params.fetch("brand_name")
  brand.update({:name => brand_name})
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

delete('/brands/:id') do
  brand = Brand.find(params.fetch("id"))
  brand.delete()
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

delete('/stores/:id') do
  store = Store.find(params.fetch("id"))
  store.delete()
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end
