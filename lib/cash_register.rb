require "pry" 
class CashRegister
  
  attr_accessor :discount, :total, :items, :prices
  
  
  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
    @prices = []
  end 
  
  def total 
    @total
  end 
  
  def add_item(title, price, quantity = 1)
    @total += (price*quantity)
    quantity.times do @items << title 
    @prices << (price*quantity)
    end 
  end 
  
  def apply_discount
    if @discount != nil 
    @total -= (@total * (@discount/100.0))
    return "After the discount, the total comes to $#{@total.to_int}."
  else 
    return "There is no discount to apply."
    end
  end 
  
  def items 
    @items
  end 
  
  def void_last_transaction
    @total -= @prices.pop
  end 
    
    
  
end 
