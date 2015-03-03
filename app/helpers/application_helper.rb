module ApplicationHelper
  def profile_link_for_current_user
    if current_user
      if current_user.profile
        link_to "Edit profile", edit_user_profile_path(current_user)
      else
        link_to "Create profile", new_user_profile_path(current_user)
      end
    end
  end

end
