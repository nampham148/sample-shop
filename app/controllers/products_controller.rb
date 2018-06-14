class ProductsController < ApplicationController
  def index
  	@category = params[:category]
  	if @category
  		@products = Product.where(category: @category).paginate(page: params[:page])
  	else
  		@products = Product.all.paginate(page: params[:page])
  	end
  end

  def show
  	@product = Product.find_by(id: params[:id])
  end
end
