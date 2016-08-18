class OrdersController < ApplicationController
  def new
    #code
  end

  def create
    ## find in the bouton show.
    # @Order = Order.new(order_param)
  end
  private

  def order_param
    params.require(:order).permit(:order, :user_id, :amount)
  end
end
