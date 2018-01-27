class MenuController < ApplicationController
  before_action :authorize
  def index
    @user = User.find(session[:user_id])

  end
end
