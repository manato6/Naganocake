class Public::OrdersController < ApplicationController
  def new
    @sum = params[:sum]
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
  
  def order_params
    params.require(:order).permit(:payment_method)
  end

end
