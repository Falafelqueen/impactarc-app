class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save!
       format.html redirect_to organisations_path
      else
        render :new
      end
      end

  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :subheading, :description, :address, :email, :phone, :linkedin, :facebook, :website, :english, :internship, :volunteering, :photo, :tags, categories: [])
  end
end
