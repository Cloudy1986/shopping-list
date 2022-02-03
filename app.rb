require 'sinatra/base'
require 'sinatra/reloader'

class ShoppingList < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  get '/shopping-list' do
    @items = ['Apples', 'Pies', 'Toilet rolls']
    erb :index
  end

  run! if app_file == $0
end
