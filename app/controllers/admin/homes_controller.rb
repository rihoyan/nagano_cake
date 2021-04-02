class Admin::HomesController < Admin::ApplicationController

  def top
    @orders = Order.page.reverse_order
  end

end
