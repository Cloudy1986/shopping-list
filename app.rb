require 'sinatra/base'
require 'sinatra/reloader'
require './lib/item'
require './lib/comment'

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
    @item = Item.find(id: params['id'])
    erb :'comments/new'
  end

  post '/shopping-list/:id/comment' do
    Comment.create(text: params['comment_text'], item_id: params['id'])
    redirect "/shopping-list/#{params['id']}/comments"
  end

  get '/shopping-list/:id/comments' do
    @item = Item.find(id: params['id'])
    @comments = Comment.where(item_id: params['id'])
    erb :'comments/index'
  end

  run! if app_file == $0
end
