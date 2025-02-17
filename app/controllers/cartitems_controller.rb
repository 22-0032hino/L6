class CartitemsController < ApplicationController
  def new
    @cartitem = CartItem.new
  end
  
  def create
    c = CartItem.new(product_id: params[:cart_item][:product_id], cart_id: current_cart.id, qty: params[:cartitem][:qty])
    c.save
    redirect_to root_path
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_path(current_cart.id)
  end
end
