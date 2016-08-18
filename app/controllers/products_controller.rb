class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :toggle_publish]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:category]
      @products = Product.where(category: params[:category])
    else
      @products = Product.all.order("created_at desc")
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def toggle_publish
    @product.published ? @product.published = false : @product.published = true
    @product.save!
    redirect_to dashboard_path(current_user)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :stock, :price, :weight, :category, :variety, :start_season, :end_season, :user_id, :published, :photo)
  end

end
