class UsersController < ApplicationController

  # GET /sessions/new
  def new
    @user = User.new
  end

  # POST /sessions
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session
  def destroy
    reset_session
    redirect_to root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def logged_in?
      redirect_to root unless session[:username]
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username)
    end
end
