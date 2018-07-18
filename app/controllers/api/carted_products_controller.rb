class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id)
    render "index.json.jbuilder"
  end

  def create
    @carted_products = CartedProduct.new(   #@carted_product > can name whatever, CartedProduct > follow model name singular
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted"
      )
    @carted_products.save
    render "show.json.jbuilder"
  end
end
