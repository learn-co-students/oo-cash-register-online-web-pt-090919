class CashRegister
  attr_accessor :total, :discount, :items, :last_amount
  
  def initialize(discount = 0.0)
    @discount = discount
    @total = 0
    @items = []
    @prices = []
  end
  
  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times {@items << title}
    @last_amount = (price*quantity)
  end
  
  def apply_discount
    @total = @total * ((100.0 - discount)/100.0)
    if discount == 0
      p "There is no discount to apply."
    else p "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_amount
  end







end