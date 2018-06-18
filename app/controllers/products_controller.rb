class ProductsController < ApplicationController
  def index
    @categories = Category.all
  	category_id = params[:category_id]
  	if category_id
  		@products = Category.find(category_id).products.paginate(page: params[:page])
  	else
  		@products = Product.all.paginate(page: params[:page])
  	end
  end

  def show
  	@product = Product.find_by(id: params[:id])
  end
end
