class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render "products.json.jbuilder"
  end

  def first
    @product1 = Product.first
    render "product.json.jbuilder"
  end
end
