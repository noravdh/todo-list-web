require 'sinatra/base'
require_relative 'lib/todolist'
class ToDoListApp < Sinatra::Base

  #this creates an instance of the todolist
  $todolist = ToDoList.new

  get '/' do
    erb :index
  end

# GET REQUEST FROM CONTROLLER
  get '/todolist' do
    #ASK MODEL FOR TODO ITEMS
    @items = $todolist.items
    # ASK VIEW FOR HTML INCLUDING TODO ITEMS
    response = erb :todos
    #SEND RESPONSE TO SERVER
    response
  end

  get '/add-item' do
    response = erb :add_item
    response
  end

  post '/add-item' do
    name = params[:name]
    category = params[:category]
    item = TodoItem.new(name, category)
    $todolist.add_item(item)
    response = redirect('/todolist')
    response
  end

  get '/todolistbycategory' do
    category = params[:category]
    items = $todolist.items
    @filtered_items = items.select { |item| item.category == category}
    response = erb :items_by_category
    response
  end

  run! if app_file == $0
end
