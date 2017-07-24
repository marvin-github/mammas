class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the users exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # save the users id inside the browser cookie. This is how we keep the users logged in when they navigate around our website.
      session[:user_id] = user.id

      redirect_to menu_index_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end