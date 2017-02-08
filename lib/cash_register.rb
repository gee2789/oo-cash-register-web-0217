
require 'pry'

#-------Defining Class/Methods/Instance Variables ------
class CashRegister
  attr_accessor(:total, :discount, :items, :last_item_price)

  def initialize(discount=0) #gives argument discount with default value 0 if not provided
    @total=0           #sets CashRegister without default value to 0
    @discount=discount #sets any CashRegister.new(20) to 20.
    @items=[] #sets empty array
    @last_item_price=0
  end

  def add_item(title, price, quantity=1) #accepts title, price, and quantity
  self.total += price * quantity #.total defined under initialize.  same with @discount.
  self.last_item_price = price * quantity
    quantity.times do #sets a loop based on the quantity
      self.items << title #pushes title of items into array
    end
  end

  def apply_discount
    if @discount != 0
      self.total = @total * (100-@discount)/100 #updates total.  Note: need to
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @last_item_price
  end
end
