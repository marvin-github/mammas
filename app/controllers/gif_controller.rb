class GifController < ApplicationController

  before_action :authorize

  def cool
    puts 'cool'
  end

  def sweet
    puts 'sweet'
  end

end
