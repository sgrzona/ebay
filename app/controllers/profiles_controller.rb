class ProfilesController < ApplicationController
 

  def my
    @profile = current_user
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to my_user_profile_path
    else
      render new_user_profile_path
    end
  end

  def show
  end

  def edit
    @profile = Profile.find(current_user.profile.id)
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
