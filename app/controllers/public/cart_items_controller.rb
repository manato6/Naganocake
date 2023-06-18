class Public::CartItemsController < ApplicationController

  def create
    @cartitem = CartItem.new(cart_item_params)
    @cartitem.customer_id = current_customer.id
    @cartitem.save
    redirect_to cart_items_path
  end

  def index
    @cartitems = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end