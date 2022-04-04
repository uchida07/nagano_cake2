class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end
  def confirm
    @orders = Order.all
  end
  def complete

  end
  def index
    @orders = Order.all
  end
  def show
    @orders = Order.find(params[:id])
  end

end
