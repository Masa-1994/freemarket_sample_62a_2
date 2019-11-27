class ProductsController < ApplicationController

  def index
    @products = Product.all.order("created_at DESC")
    @images = Image.includes(:product)
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
    @product= Product.new(
      category_id: params[:category_id].to_i,
      name: product_params[:name],
      description: product_params[:description],
      condition: product_params[:condition],
      shipping_charge: product_params[:shipping_charge],
      shipping_area: product_params[:shipping_area],
      shipping_date: product_params[:shipping_date],
      shipping_method: product_params[:shipping_method],
      price: product_params[:price],
      size_id: product_params[:size_id],
      brand_id: product_params[:bland_id],
      seller_id: current_user.id
    )
    #imageテーブルへ保存
    @product.images.build(
      image: product_params[:images_attributes]["0"]["image"]
    )
    if @product.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  def show
    @images = Image.includes(:product)
    @product = Product.find(params[:id])
    @seller = User.find(@product.seller_id)
  end

  def buy
    @images = Image.includes(:product)
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(
      :name, 
      :description,
      :condition, 
      :shipping_charge,
      :shipping_area,
      :shipping_date,
      :shipping_method,
      :category_id,
      :price,
      images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
