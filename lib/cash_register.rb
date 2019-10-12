require 'pry'

class CashRegister

  attr_accessor :total, :last_trans
  attr_reader :discount
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty = 1)
    self.total += (price * qty)
    self.last_trans = (price * qty)
    while qty > 0 
      @items << title
      qty -= 1
    end
  end
 
  def apply_discount
    if @discount > 0
      "After the discount, the total comes to $#{@total -= @discount * 10}."
    else
      "There is no discount to apply."
    end
  end
 
 def items
  @items
 end
 
 def void_last_transaction
  self.total -= self.last_trans
 end
 
end