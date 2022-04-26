class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @organisations = @user.organisations
  end

  def create

  end

  def unsave_organisation
    user = User.find(params[:id])
    organisation = Organisation.find(params[:organisation])
    user.organisations.delete(organisation)
    redirect_to user_path(user)
  end
end
