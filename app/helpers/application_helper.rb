module ApplicationHelper
  def logged_in?
    if session[:name]
      link_to('LOGOUT', session_path(session[:user_id]), method: :delete, class: 'navbar-item is-uppercase has-text-weight-semibold has-text-grey')
    else
      link_to('LOGIN', new_session_path, class: 'navbar-item is-uppercase has-text-weight-semibold has-text-grey') + 
      link_to('REGISTER', new_user_path, class: 'navbar-item is-uppercase has-text-weight-semibold has-text-grey')
    end
  end

  def current_user
    return session[:name]
  end

  def current_user_id
    return session[:user_id]
  end

  def show_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end

end
