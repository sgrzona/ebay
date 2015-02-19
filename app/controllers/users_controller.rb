class UsersController < ApplicationController
  def show
  	redirect_to "/", notice: "Signed in"
  end
end
