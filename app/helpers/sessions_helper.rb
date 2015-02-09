module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def correct_user
      if @auction.user_id != current_user.id
        redirect_to auctions_path, error: "Not authorized to edit this auction" 
      end
  end
end
