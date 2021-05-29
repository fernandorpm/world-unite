class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.includes(:articles).find(params[:id])
    end
end
