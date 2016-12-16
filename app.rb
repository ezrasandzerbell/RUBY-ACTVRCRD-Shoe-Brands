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
