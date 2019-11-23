class ProductsController < ApplicationController

  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
    @product.images.build
    # @images = Image
  end

  def create
    @product= Product.create(product_params)
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
    params.require(:product).permit(:name, :description, :condition, :price, images_attributes: [:image, :product_id])
  end

end
