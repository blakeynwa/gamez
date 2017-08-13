helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user ? true : false
  end

  def report_create_errors(errors)
    @errors = errors
    erb :'/users/create_user'
  end

  def report_login_errors
    @errors = ["Login information does not match."]
    erb :'/users/login_page'
  end

end
