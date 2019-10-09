class CashRegister
  
  attr_accessor :total, :item_amounts
  attr_reader :discount, :items
  
  def initialize(discount=0)
    @item_amounts = []
    @items = []
    @total = 0
    @discount = discount
  end
  
  def add_item(title, price, quantity=1)
    counter = quantity
    while counter >= 1 do
      @items.push(title)
      @item_amounts.push(price * quantity)
      counter -= 1
    end
      @total = @total + (price * quantity)
  end
  
  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total = @total * (1.00 - (@discount.to_f / 100))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def void_last_transaction
    @total = @total - @item_amounts.pop
  end
  
    
    
end
