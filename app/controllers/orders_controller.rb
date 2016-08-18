class OrdersController < ApplicationController
  def new
    #code
  end

  def create
    @user = User.find(params[:order][:user])

  if  @user.orders.last == nil
      @order = Order.new
      @order.user = @user
      @order_item = OrderItem.new
      @order_item.product = Product.find(params[:order][:product])
      @order_item.order = @order
      @order_item.quantity = params[:order][:amount]
      @price = @order_item.product.price
      @order.amount = @price * @order_item.quantity
      @order_item.save
      @order.order_items << @order_item
      @order.save
      redirect_to products_path
  elsif @user.orders.last.current_order
    @order = @user.orders.last
    @order_item = OrderItem.new
    @order_item.product = Product.find(params[:order][:product])
    @order_item.quantity = params[:order][:amount]
    @price = @order_item.product.price
    @order.amount += @price * @order_item.quantity
    @order_item.save
    @order.order_items << @order_item
    @order.save
    redirect_to products_path
  else
    @order = Order.new
    @order.user = @user
    @order_item = OrderItem.new
    @order_item.product = Product.find(params[:order][:product])
    @order_item.order = @order
    @order_item.quantity = params[:order][:amount]
    @price = @order_item.product.price
    @order.amount = @price * @order_item.quantity
    @order_item.save
    @order.order_items << @order_item
    @order.save
    redirect_to products_path
  end
end

def pending_order
  @user = User.find(params[:order][:user])
  @user.orders.last.current_order = false
  @user.orders.last.pending_order = true
end

def validate_order
  @user = User.find(params[:order][:user])
  @user.orders.last.pending_order = false
  @user.orders.last.validates_order = true
end

  private

  def order_param
    params.require(:order).permit(:order, :user)
  end
end
