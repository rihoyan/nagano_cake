class Public::OrdersController < ApplicationController

  def new
    @addresses = Address.all
    @customer = current_customer
    @order = Order.new
  end
end
