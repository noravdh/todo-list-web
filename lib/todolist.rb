require_relative 'todoitem'
class ToDoList
  def initialize
    @items = [TodoItem.new("Buy milk", "Domestic"),
              TodoItem.new("Tax returns", "Finance")
    ]
  end

  def add_item(item)
    @items.push(item)
  end

  def items
    @items
  end

end
