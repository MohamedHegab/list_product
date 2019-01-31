class Frontend::CategoriesController < ApplicationController
  before_action :set_category, only: :show

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
end
