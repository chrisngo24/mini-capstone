class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    id = params["id"]
    @product = Product.find_by(id: id)
    render "show.json.jbuilder"
  end

end
