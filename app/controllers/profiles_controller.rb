class ProfilesController < ApplicationController

  def my
    @profile = nil
    if current_user.profile
      @profile = current_user.profile
    else
      redirect_to new_user_profile_path(current_user)
    end
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to my_user_profile_path
    else
      render new
    end
  end

  def show
  end

  def edit
    @profile = Profile.find(current_user)
  end

  def update
    @profile = Profile.find(current_user.profile.id)
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile Updated"
      redirect_to current_user
    else
      flash.now[:error] = "Something went wrong" 
      render edit_user_profile_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :blurb, :image, :user_id)
  end
end
