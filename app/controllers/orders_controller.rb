class OrdersController < ApplicationController
  def new
    #code
  end

  def create
    ## find in the bouton show.
     @order = Order.new
     @order.user = User.find(params[:order][:user])
     @order_items = OrderItem.new
     @order_items.product = Product.find(params[:order][:product])
     @order_items.order = @order
     @order_items.quantity = params[:order][:amount]
     @price = @order_items.product.price
     @order.amount += @price * @order_items.quantity
     @order.order_items << @order_items
     raise
  end
  private

  def order_param
    params.require(:order).permit(:order, :user)
  end
end
