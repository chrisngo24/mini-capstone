class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb" 
  end

  def show
    @products = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end
end
