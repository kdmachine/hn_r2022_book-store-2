class Admin::OrdersController < AdminController
  authorize_resource class: false

  before_action :load_order, only: %i(destroy update)
  before_action :load_and_search_orders, only: %i(index destroy update)

  def index; end

  def update
    ActiveRecord::Base.transaction do
      @order.public_send("status_#{params[:order][:status]}!")
    end
    refresh
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "update_fail"
    redirect_to admin_orders_path
  end

  def destroy
    ActiveRecord::Base.transaction do
      @order.status_rejected!
    end
    refresh
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "delete_fail"
    redirect_to admin_orders_path
  end

  private

  def load_and_search_orders
    @search = Order.ransack params[:q]
    @pagy, @orders = pagy @search.result.newest,
                          items: Settings.page_items_10
  end
end
