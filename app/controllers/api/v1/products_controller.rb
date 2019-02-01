class Api::V1::ProductsController < Api::BaseController
  before_action :set_category, only: [:index, :create]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/categories/:category_id/products
  def index
    @products = @category.products
    render json: @products, each_serializer: CategorySerializer
  end

  # GET /api/v1/products/1
  def show
    json_response(@product)
  end

  # POST /api/v1/categories/:category_id/products
  def create
    @product = @category.products.new(product_params)

    if @product.save
      @product.image.attach(params[:image])
      json_response(@product, :created)
    else
      json_response({ errors: @product.errors }, :unprocessable_entity)
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      @product.image.attach(params[:image])
      json_response(@product)
    else
      json_response({errors: @product.errors }, :unprocessable_entity)
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image)
    end
end
