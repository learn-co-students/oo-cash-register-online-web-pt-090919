require 'pry'
class CashRegister
  attr_reader :discount, :items
  attr_writer :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = Array.new
  end
  
  def total
    @total  
  end
  
  def add_item(title, price, quantity=1)
    @quantity = quantity
    @price = price
    quantity.times do 
      @total = @total + price
      @items << title
    end 
  end
  
  def apply_discount
    if @discount != 0
      @total -= @total * (@discount/100.0)
      p "After the discount, the total comes to $#{@total.to_i}."
    else
      p "There is no discount to apply."
    end  
  end

  def void_last_transaction
    @total -= @price * @quantity
  end

end
