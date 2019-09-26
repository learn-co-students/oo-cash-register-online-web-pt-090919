class CashRegister
  attr_accessor :total, :discount, :item_list, :last_transaction_amount
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_list = []
    total * ((100 - discount)/100)
  end

  def add_item(item, price, quantity = 1)
    @last_transaction_amount = price * quantity
    quantity.times {self.item_list << item}
    self.total = total + (price * quantity)
  end

  def apply_discount
    if discount != 0
      self.total = total * (100 - discount)/100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    self.item_list
  end

  def void_last_transaction
    self.total = total - last_transaction_amount
  end
end
