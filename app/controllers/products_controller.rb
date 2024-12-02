class ProductsController < ApplicationController
	before_action :get_product, except: [:index, :sync, :add_to_cart]
  
  def sync
    Product.destroy_all
    Import.sync
    redirect_to products_path, notice: "Products Sync successfully."
  end

  def add_to_cart
    @cart = Cart.first_or_create
    products = Product.where(id: params[:ids])
    @cart.products << products
    respond_to do |format|
      format.html{redirect_to cart_path(@cart), notice: "Item added successfully."}
    end
  end

  def index
  	@products = Product.all
  end

  def show
    @product
  end

  def edit
    @product
  end

  def update
    if @product.update(update_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  	redirect_to products_path if @product.destroy
  end

  private

  def update_params
    params.require(:product).permit(:title, :price, :description)
  end

  def get_product
  	@product = Product.find(params[:id])
  end
end
