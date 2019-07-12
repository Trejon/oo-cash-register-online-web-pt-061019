class CashRegister 
  
attr_accessor :total, :discount, :items, :transaction 
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transaction = []
  end 
  
  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times do |item|
      @items << title 
    end
    @transaction << [price, quantity]
  end 
  
  def apply_discount
    @total = @total - (@total * @discount)/100
    if @discount > 0
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end 
  
    #def items 
     # @items
    #end 
 
  
  def void_last_transaction
    last = @transaction.pop
    @total = @total - (last[0] * last[1])
    last[1].times do
      @items.pop
      end 
  end 
end 

cr = CashRegister.new
cr.add_item("carrots", 2)
cr.add_item("chips", 3, 2)
puts cr.total
puts cr.items
puts cr.transaction
cr.void_last_transaction
puts cr.items 
puts cr.total
  
