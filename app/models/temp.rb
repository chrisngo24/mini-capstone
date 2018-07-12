@product.image = params[:image] || @product.image
image: params[:image]
json.image @product.image
json.image product.image