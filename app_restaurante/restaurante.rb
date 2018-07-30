require_relative 'checkout_module'
require_relative 'orders_module'
require_relative 'menu_module'


class Restaurant

    include Payments
    include Orders
    include RestaurantMenu

    attr_reader :ck, :menu_local
    
    def initialize
        @menu_local=Menu::RestaurantMenu.new 
        @ck=Payments::RestaurantCheckout.new         
    end

    def new_order
        ro=Orders::RestaurantOrder.new
        ro.add_item
    end

    def proced_checkout
        @ck.order_pay
    end

    def payment_resume
        @ck.get_payment
    end

    def total_income
        @ck.total_payments
    end

    def insert_menu_item
        @menu_local.add_product()
    end

    def get_menu_items
        @menu_local.show_menu
    end

    def get_item_byid
        puts "\n\nIngrese el código del producto a buscar:"
        product_id=gets.chomp.to_i
        @menu_local.get_product_byid(product_id)
    end

end