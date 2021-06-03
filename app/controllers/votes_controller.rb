class VotesController < ApplicationController
  before_action :redirect_unlogged_user, only: %i[create destroy]

  include ApplicationHelper

  def create
    article_id = params[:article_id]
    category = Article.get_category_of(article_id)

    @vote = current_user.votes.new(article_id: article_id)

    if Vote.already_voted(current_user_id, article_id)
      redirect_to category_path(category), alert: 'You already voted for this article.'
    elsif @vote.save
      redirect_to category_path(category), notice: 'You voted for this article.'
    else
      redirect_to category_path(category), alert: 'You cannot vote for this article.'
    end
  end

  def destroy
    vote_id = params[:id]
    article_id = params[:article_id]
    category = Article.get_category_of(article_id)

    vote = Vote.where(id: vote_id, user_id: current_user_id).first

    if vote
      vote.destroy
      redirect_to category_path(category), notice: 'You unvoted this article.'
    else
      redirect_to category_path(category), alert: 'You cannot unvote a article that you did not vote for before.'
    end
  end

  private

  # Check if there is a user logged in (stored in sessions)
  def logged_in?
    session[:name]
  end

  # Redirect the visitor if they're not logged in
  def redirect_unlogged_user
    return if logged_in?

    redirect_to new_session_path
    flash[:alert] = 'You must be logged in to vote or unvote.'
  end
end
