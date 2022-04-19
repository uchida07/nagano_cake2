class Public::CustomersController < ApplicationController
  def show
    @my_page = Customer.find(params[:id])
  end

  def unsubscribe
  end

  def edit
    @my_page = Customer.find(params[:id])
  end

  def update
    @my_page = Customer.find(params[:id])
    @my_page.update(customer_params)
    redirect_to customer_path(@my_page.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
