require 'pry'

class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction_amount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction_amount = 0
    end

    def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
            self.items.push(item)
        end
        self.last_transaction_amount = price * quantity
    end

    def apply_discount
        if (self.discount == 0)
            return "There is no discount to apply."
        else 
            temp_discount = (100.0 - self.discount) / 100.0
            self.total *= temp_discount
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction_amount
    end

end
