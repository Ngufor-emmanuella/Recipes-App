class ShoppingItem
  attr_accessor :required_quantity, :food

  def initialize(food, required_quantity)
    @food = food
    @required_quantity = required_quantity
  end
end
