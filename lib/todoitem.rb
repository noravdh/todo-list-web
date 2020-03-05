class TodoItem
  attr_reader :name, :category, :deadline
  def initialize(name, category, deadline = nil)
    @name = name
    @category = category
    @deadline = deadline
  end
end
