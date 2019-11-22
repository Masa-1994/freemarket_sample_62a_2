class ProductsController < ApplicationController

  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
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
    params.require(:product).permit(:images, :name, :condition, :price, image_attributes: [image])
  end

end
