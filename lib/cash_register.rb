require 'pry'

class CashRegister 
  
  attr_accessor :total, :discount, :last_price, :item_list
  

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_list = []
    @last_price = []
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    quantity.times {items << title}
    quantity.times {self.last_price << (price * quantity)}
  end
  
  def apply_discount
    if self.discount != 0 
      self.total -= (self.total * self.discount / 100)
      "After the discount, the total comes to $#{self.total.round(2)}."
    else
      "There is no discount to apply."
    end
  end
  
  def items 
    @item_list
  end
  
  def void_last_transaction
    self.total -= self.last_price[-1]
    self.total.round(2)
  end

end






