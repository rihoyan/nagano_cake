class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      flash[:success] = "会員情報を更新しました！"
      redirect_to admin_customer_path(params[:id])
    else
      flash[:danger] = "更新に失敗しました"
      @customer = Customer.find(params[:id])
      render :edit

    end
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
    end
end
