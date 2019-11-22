class ProductsController < ApplicationController

  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
    @product.images.build
    @images = Image
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        render 'index'
    else
        render 'new'
    end
  end

  def show
  end

  def buy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :condition, :price, image_attributes: [:url, :product_id])
  end

end
