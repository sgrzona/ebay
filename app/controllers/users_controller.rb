class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
  	@users = User.order("email asc").all
  end


  def show
  	redirect_to "/", notice: "Signed in"
  end
end
