#TODO - test drive this model object to have

class ToDoList

  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end


end
