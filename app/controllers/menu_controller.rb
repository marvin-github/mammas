class MenuController < ApplicationController
  before_action :authorize
  def index
    @user = User.find(session[:user_id])
    puts @user.inspect
    if @user.admin?
      puts 'yessssss'
      puts @user.admin
    end
  end
end
