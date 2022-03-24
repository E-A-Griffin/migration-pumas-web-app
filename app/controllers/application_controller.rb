class ApplicationController < ActionController::Base
  def index
    @df1 = Df1Original.first
  end
end
