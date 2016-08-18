class OrdersController < ApplicationController
  def new
    #code
  end

  def create
    ## find in the bouton show.
    @order = Order.new(order_param)
    # @order.user = params[:order][:user_id]
    raise
    # @order.product = params[:order][:product_id]

  end
  private

  def order_param
    params.require(:order).permit(:order, :user)
  end
end
