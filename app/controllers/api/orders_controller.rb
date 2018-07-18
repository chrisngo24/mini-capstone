class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    product = CartedProduct.where(status: "carted")
    quantity = params[:quantity].to_i
    calculated_subtotal = product.price * quantity
    calculated_tax = product.tax * quantity
    calculated_total = product.total * quantity

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render "show.json.jbuilder"

    # order = Order.new(
    #   product_id = params["id"]
    #   Product.find_by(id: params[:id]
    #   qty = params["qty"]
    #   quantity = params[:qty]
    #   subtotal = )
    #user_id or current_user?
    #product_id
    #quantity
    #sub_total
    #tax
    #total
  end
end
