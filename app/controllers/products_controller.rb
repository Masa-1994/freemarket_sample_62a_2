class ProductsController < ApplicationController

  def index
    @products = Product.all.order("created_at DESC")
    @images = Image.all.includes(:product)
  end

  def new
    @product = Product.new
    @product.images.build

    #親カテゴリーを呼び出す
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @product= Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  def show
    @product = Product.find(1)
    @seller = User.find(@product.seller_id)
  end

  def buy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description,:condition, :shipping_charge,:shipping_area,:shipping_charge,:shipping_area,:shipping_date,:shipping_method,:price,images_attributes: [:image,:product_id]).merge(seller_id:"1",category_id:"1")
  end

end
