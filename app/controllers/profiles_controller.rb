class ProfilesController < ApplicationController

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to my_user_profile_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @profile = (@user and @user.profile ? @user.profile : nil)
  end

  def edit
    if current_user.profile.present?
      @profile = current_user.profile
    else
     flash[:error] = "No profile exists for current user"
     redirect_to new_user_profile_path
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
       flash[:success] = "Profile Updated"
       render "show"
    else
      render "edit"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:image, :username, :first_name, :last_name, :blurb, :user_id)
  end
end
