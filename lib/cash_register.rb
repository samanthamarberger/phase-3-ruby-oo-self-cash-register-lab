
class CashRegister

    attr_accessor :total, :discount, :items, :item_costs
    
    def initialize(employee_discount = 0)
        @discount = employee_discount
        @total = 0
        @items = []
        @item_costs = []
    end

    def add_item(title, price, quantity = 1)
        self.total = self.total + (price * quantity)
        quantity.times do
            self.items.push(title)
        end
        self.item_costs.push(price)
    end
   
    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else 
            self.total = self.total - ((self.total * self.discount) / 100)
            return "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.items.pop
        self.total = self.total - self.item_costs[-1]
        self.item_costs.pop
        if self.item_costs.empty?
            self.total = 0.0
        end
    end

end
