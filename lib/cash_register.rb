class CashRegister

    attr_accessor :total, :discount, :items
  
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last = []
    end
    def add_item(item, price, quant=1)
        @last = [item, price, quant]
        while quant >0
            @items << item
            @total+=price
            quant-=1
        end
    end
    def apply_discount
        if @discount == 0 then 
            return "There is no discount to apply."
        else
            @total-=(@total*(@discount.to_f/100))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end
    def void_last_transaction
        while @last[2]>0    
            @items.pop()
            @total-=@last[1]
            @last[2]-=1
        end
    end

end