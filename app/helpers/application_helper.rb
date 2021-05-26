module ApplicationHelper
  def logged_in?
    if session[:name]
      link_to 'LOGOUT', session_path(1), method: :delete, class: 'navbar-item'
    else
      link_to('LOGIN', new_session_path, class: 'navbar-item') + 
      link_to('REGISTER', new_user_path, class: 'navbar-item')
    end
  end

  def current_user
    return session[:name]
  end

end
