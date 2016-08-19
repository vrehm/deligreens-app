class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_order = Order.where(user_id: current_user, current_order: true)
    @pending_orders = Order.where(user_id: current_user, pending_order: true)
    @validate_orders = Order.where(user_id: current_user, validate_order: true)
    @producers = User.where(producer: true)

  end

  def dashboard
    @user = User.find(params[:id])
    @products = Product.where(user_id: @user)
  end
end
