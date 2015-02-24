class UsersController < ApplicationController
  def show
  	redirect_to my_auctions_path, notice: "Signed in"
  end
end
