module ApplicationHelper
  def logged_in?
    if session[:name]
      link_to('LOGOUT', session_path(session[:user_id]), method: :delete,
                                                         class: 'navbar-item is-uppercase has-text-weight-semibold has-text-grey navbar-logged-in')
    else
      link_to('LOGIN', new_session_path,
              class: 'navbar-item is-uppercase has-text-weight-semibold has-text-grey navbar-logged-in') +
        link_to('REGISTER', new_user_path,
                class: 'navbar-item is-uppercase has-text-weight-semibold has-text-grey navbar-logged-in')
    end
  end

  def current_user
    User.where(id: current_user_id).first
  end

  def current_user_name
    session[:name]
  end

  def current_user_id
    session[:user_id]
  end

  def show_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      raw file.read
    end
  end

  def vote_btn(article)
    vote = Vote.where(user_id: current_user_id, article_id: article.id).first
    if vote
      link_to('Unvote', article_vote_path(id: vote.id, article_id: article.id),
              class: 'button is-danger max-button-size is-light', method: :delete)
    else
      link_to('Vote', article_votes_path(article_id: article.id), class: 'button is-success max-button-size is-light',
                                                                  method: :article)
    end
  end
end
