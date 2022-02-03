require 'sinatra/base'
require 'sinatra/reloader'
require './lib/item'

class ShoppingList < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  get '/shopping-list' do
    @items = Item.all
    p @items
    erb :index
  end

  run! if app_file == $0
end
