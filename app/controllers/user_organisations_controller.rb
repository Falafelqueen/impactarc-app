class UserOrganisationsController < ApplicationController

  def destroy
    user = User.find(params[:user])
    organisation = Organisation.find(params[:organisation])
    @user_organisation = UserOrganisation.where(user: params[:user], organisation: params[:id])
    redirect_to user_path(params[:user])
  end
end
