class OrdersController < ApplicationController
  def create
    @user = User.find(params[:order][:user])

    if @user.orders.last == nil
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
      flash[:notice] = "#{@order_item.quantity} #{@order_item.product.name} ont été ajouté au panier"
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
      flash[:notice] = "#{@order_item.quantity} #{@order_item.product.name} ont été ajouté au panier"
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
      flash[:notice] = "#{@order_item.quantity} #{@order_item.product.name} ont été ajouté au panier"
      redirect_to products_path
    end
  end

  def pay
    @order = Order.find(params[:id])
    @order.current_order = false
    @order.pending_order = true
    @order.save
    redirect_to user_path(current_user)
  end

  def validate
    @order = Order.find(params[:id])
    @order.pending_order = false
    @order.validate_order = true
    @order.save
    redirect_to dashboard_path(current_user)
  end

  private

  def order_param
    params.require(:order).permit(:order, :user)
  end
end
