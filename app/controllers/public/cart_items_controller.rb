class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }


  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    current_cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if current_cart_items.present?
      cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
      cart_item.update!(amount: cart_item.amount + @cart_item.amount)
      redirect_to cart_items_path
    else
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end

  end

  def destroy_all
    @cart = current_customer.cart_items
    @cart.destroy_all
    redirect_to '/cart_items'
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to '/cart_items'
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to '/cart_items'
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :name)
  end
end
