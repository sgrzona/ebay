class UsersController < ApplicationController
 
 
  def index
  	@users = User.order("email asc").all
  end


  def show
  	redirect_to "/", notice: "Signed in"
  end
end
