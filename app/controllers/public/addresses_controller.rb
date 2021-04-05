class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    p @address
    @address.save!
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy!
    redirect_to addresses_path
  end

private
  def address_params
    params.require(:address).permit(:name, :postal_code, :addresses, :customer_id)
  end

end
