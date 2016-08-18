class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = Product.where(user_id: @user)
    @producers = User.where(producer: true)
  end

  def dashboard
    @user = User.find(params[:id])
    @products = Product.where(user_id: @user)
  end
end
