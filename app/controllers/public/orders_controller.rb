class Public::OrdersController < ApplicationController
  def new
    @sum = params[:sum]
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart_item|

      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.number = cart_item.amount
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_detail.purchase_price = cart_item.item.price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_detail.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)

  end


  def index
     @orders = Order.all
  end

  def show
     @order = Order.find(params[:id])
      @orders = Order.all
  end

  def confirm
    @cartitems = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.postage = 800
    @sum = params[:order][:sum]
  end

  def complete
  end

  def order_params
    params.require(:order).permit(:method_of_payment, :customers_id, :destination_name,:delivery_postal_code,:shipping_address,:postage,:total_amount)
  end

end
