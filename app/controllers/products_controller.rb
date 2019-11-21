class ProductsController < ApplicationController

  def index
    @products = Product.find(1)
    @images = Image.find(1)
  end

  def new
  end

  def create
  end

  def show
  end

  def buy
  end
  
end
