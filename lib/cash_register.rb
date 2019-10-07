class CashRegister
  
  attr_accessor :total, :discount, :items, :last
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    self.last = self.total
    self.total += price*quantity
    quantity.times { self.items << title }
  end
  
  def apply_discount
    return "There is no discount to apply." if self.discount == 0
    self.total = (total*(100.0-discount)/100).to_i
    "After the discount, the total comes to $#{self.total}."
  end
  
  def void_last_transaction
    self.total = self.last
  end
  
end