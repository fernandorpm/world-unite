class SessionsController < ApplicationController
  before_action :redirect_unlogged_user, only: %i[ destroy ]

  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
    login_session = params[:name]
    @user = User.find_by(name: login_session)

    respond_to do |format|
      if @user
        session[:name] = login_session
        format.html { redirect_to @user, notice: "You are now logged in." }
      else
        format.html { render :new, status: :unprocessable_entity }
        flash.now[:alert] = 'Name not found. Please try again.'
      end

    end
  end

  # DELETE /session
  def destroy
    reset_session
    redirect_to root_path
  end

  private
    # Check if there is a user logged in (stored in sessions)
    def logged_in?
      return session[:name]
    end

    # Redirect the visitor if they're not logged in
    def redirect_unlogged_user
      redirect_to root_path unless logged_in?
    end

end
