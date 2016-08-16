class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params

  end

end
