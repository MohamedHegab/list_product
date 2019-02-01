class Api::V1::CategoriesController < Api::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/categories
  def index
    @categories = Category.all
    render json: @categories, each_serializer: CategorySerializer
  end

  # GET /api/v1/categories/1
  def show
    json_response(@category)
  end

  # POST /api/v1/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      json_response(@category, :created)
    else
      json_response({ errors: @category.errors }, :unprocessable_entity)
    end
  end

  # PATCH/PUT /api/v1/categories/1
  def update
    if @category.update(category_params)
      render json: @category, status: :ok, location: @category
    else
      render json: { errors: @category.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/1
  def destroy
    @category.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
