class OrdersController < ApplicationController
  def new
    #code
  end

  def create
    @order = Order.new
    @order.user = User.find(params[:order][:user])
    @order_items = OrderItem.new
    @order_items.product = Product.find(params[:order][:product])
    @order_items.order = @order
    @order_items.quantity = params[:order][:amount]
    @price = @order_items.product.price
    if @order.amount
      @order.amount += @price * @order_items.quantity
    else
      @order.amount = @price * @order_items.quantity
    end
    @order_items.save!
    @order.order_items << @order_items
    @order.save!
    redirect_to products_path
  end

  private

  def order_param
    params.require(:order).permit(:order, :user)
  end
end
