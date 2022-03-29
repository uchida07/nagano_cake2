class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(addresses_params)
    @address.save
    redirect_to addresses_path
  end

  private
  def addresses_params
    params.require(:address).permit(:postal_code, :name, :addresses)
  end
end
