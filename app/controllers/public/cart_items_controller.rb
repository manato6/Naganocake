class Public::CartItemsController < ApplicationController

  def create
    @cartitem = Cartitem.new(cart_item_params)
    @cartitem.customer_id = current_customer.id
    @cartitem.save
    redirect_to cart_items_path
  end

  def index
    @cartitems = Cartitem.all
  end

   private
  def cart_item_params
      params.require(:cartitem).permit(:item_id, :amount)
  end
end