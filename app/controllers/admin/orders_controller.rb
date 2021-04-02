class Admin::OrdersController < Admin::ApplicationController
  def index
    @order = Order.find(params[:id])
  end

  def update
  end
end
