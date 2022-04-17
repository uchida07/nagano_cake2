class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }

    @order = Order.new(order_params)
    @order.order_datails.build
    if params[:order][:select_address] == "0"
      @address = current_customer
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.addresses
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @order.postage = 800
    @order.billing_amount = @total + @order.postage
    render :confirm

  end
  def complete

  end
  def index
    @orders = current_customer.orders


  end
  def show
    @order = Order.find(params[:id])


  end
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :billing_amount, order_datails_attributes: [:id, :item_id, :order_id, :price, :amount])
  end
end
