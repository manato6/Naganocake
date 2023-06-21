class Public::OrdersController < ApplicationController
  def new
    @sum = params[:sum]
  end

  def create
    @order = Order.new(order_params)
    
  end

  def index
  end

  def show
  end

  def confirm
    @cartitems = CartItem.all
    @order = Order.new(order_params)
    @order.postage = 800
    @sum = params[:order][:sum]
  end

  def complete
  end

  def order_params
    params.require(:order).permit(:payment_method, :customers_id, :destination_name,:delivery_postal_code,:shipping_address,:postage,:total_amount)
  end

end
