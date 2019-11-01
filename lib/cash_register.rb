require 'pry'

class CashRegister 
  attr_accessor :total, :discount

  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_list = []
    @last_transaction_prices = []
    
  end
  
  def add_item(title, price, quantity = 1)
    self.total += (price * quantity) 
    quantity.times{items << title}
    quantity.times{last_transaction << (price * quantity)}
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
    @items_list #=> [milk, milk, milk, milk, milk, juice, juice]
  end
  
  def last_transaction
    @last_transaction_prices
  end
  
  def void_last_transaction 
    self.total -= last_transaction[-1]

  end 
  
end





