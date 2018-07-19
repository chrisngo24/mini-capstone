class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    @products = Product.all

    search_terms = params[:q]
    if search_terms
      @products = @products.where("name ILIKE ?", "#%{search_terms}%")
    end

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      image_url: params[:image_url]
    )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end
    
  def show
    id = params["id"]
    @product = Product.find_by(id: id)
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name 
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: 406
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product Successfully REMOVED"}
  end
end
