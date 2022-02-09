require 'sinatra/base'
require 'sinatra/reloader'
require './lib/item'

class ShoppingList < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override

  get '/' do
    erb :homepage
  end

  get '/shopping-list' do
    @items = Item.all
    erb :'items/index'
  end

  get '/shopping-list/new' do
    erb :'items/new'
  end

  post '/shopping-list/new' do
    Item.create(name: params['name'])
    redirect '/shopping-list'
  end

  delete '/shopping-list/:id' do
    Item.delete(id: params['id'])
    redirect '/shopping-list'
  end

  get '/shopping-list/:id/edit' do
    @item = Item.find(id: params['id'])
    erb :'items/edit'
  end

  patch '/shopping-list/:id/edit' do
    Item.update(id: params['id'], name: params['name'])
    redirect '/shopping-list'
  end

  get '/shopping-list/:id/comment/new' do
    "Add a new comment"
  end

  run! if app_file == $0
end
