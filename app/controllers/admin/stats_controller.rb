module Admin
  class StatsController < Admin::ApplicationController
    
    def index
      @users = User.all
      @orders = Order.all
      @items = Item.all
      @total_amount = total_amount(@orders)
    end

    def total_amount(orders)
      total_amount=0
      orders.each do |order|
        order.items.each do |item|
        total_amount = total_amount+item.price
        end
      end
      return total_amount
    end
  
  end
end
