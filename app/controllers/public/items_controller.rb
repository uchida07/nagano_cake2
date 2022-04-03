class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.save
  #   redirect_to item_path(@item.id)
  # end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end
end
