require 'sinatra/base'
require_relative 'lib/todolist'
class ToDoListApp < Sinatra::Base

  #this creates an instance of the todolist
  $todolist = ToDoList.new

  get '/' do
    'Hello world'
  end

  get '/todolist' do
    #todo - write the code which reads items from $todolist
    @items = $todolist.items
    erb :todos
  end

  post '/add-item' do
    item = params['item']
    $todolist.add_item(item)

    redirect('/todolist')
  end

  get '/add-item-input' do
    erb :add_item
  end

  run! if app_file == $0
end
