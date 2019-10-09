require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = [] # contains a array of hashes of all transactions (title, price, quantity)
  end
  
  def add_item(title, price, quantity = 1)
    item_data = {
      title: title,
      price: price,
      quantity: quantity,
      transaction_total: price * quantity
    }
    @items << item_data
    @total += item_data[:transaction_total]
  end
  
  # tip: can call instance method inside another instnace method
  # to call @total, use self.total inside another #method
  def apply_discount
    if @discount
      discount = @total * @discount / 100 
      @total = @total - discount
      return "After the discount, the total comes to $#{@total}."
    else # cash register wasn't initiailzied w/ discount
      return "There is no discount to apply."
    end
  end
  
  # Returns an array of strings detailing the titles of the items
  def items
    to_return = []
    @items.each do |item_data|
      item_data[:quantity].times do
        to_return << item_data[:title]
      end
    end
    return to_return
  end
  
  def void_last_transaction
    last_trans = @items.pop
    @total -= last_trans[:transaction_total]
  end

end
