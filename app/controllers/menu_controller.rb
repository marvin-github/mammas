class MenuController < ApplicationController
  def index
    x = User.all
    x.each do |y|
      puts y.email
    end
  end
end
