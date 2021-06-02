class ArticlesController < ApplicationController
  before_action :redirect_unlogged_user, only: %i[ new create edit update destroy ]
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.includes(:author).all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params.except(:category_id))

    respond_to do |format|
      if @article.valid?
        category = Category.find(article_params[:category_id])
        @article = category.articles.create(article_params.except(:category_id))

        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.includes(:author).find(params[:id])
    end

    # Check if there is a user logged in (stored in sessions)
    def logged_in?
      return session[:name]
    end

    # Get current logged user id
    def current_user_id
      return session[:id]
    end

    # Redirect the visitor if they're not logged in
    def redirect_unlogged_user
      if !logged_in?
        redirect_to new_session_path
        flash[:alert] = 'You must be logged in to write an article.'
      end
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(
        :author_id, :title, :text, :image, :category_id
      )
    end
end
