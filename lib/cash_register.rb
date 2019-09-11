class CashRegister
  attr_accessor :total, :cash_register, :discount, :items, :price
  @@all = []
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @@all << self
  end
  
  def add_item(item, price, quantity = 1)
    @total += price * quantity
    quantity.times do 
      @items << item
    end
    @price = price * quantity
  end
  
  def apply_discount
    if @discount != 0
      @total -= (@total * 20) / 100 
      p "After the discount, the total comes to $#{@total}."
    else 
      p "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @price
    @items.pop()
  end
  
end
