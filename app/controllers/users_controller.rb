class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:name] = @user.name
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Check if there is a user logged in (stored in sessions)
    def logged_in?
      return session[:name]
    end

    # Redirect the visitor if they're not logged in
    def redirect_unlogged_user
      if !logged_in?
        redirect_to new_session_path
        flash[:alert] = 'You must be logged in to proceed.'
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
    end
end
