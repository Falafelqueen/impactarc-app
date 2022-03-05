class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
      if @organisation.save!
        params[:organisation][:search_words].each do |entry|
          search_word = SearchWord.find_by(search_word: entry)
          Tag.create(organisation_id: @organisation.id, search_word_id: search_word.id )
        end
        redirect_to organisations_path
      else
        render :new
      end
  end

  private

  def organisation_params
    params.require(:organisation).permit(
      :name,
      :subheading,
      :description,
      :address,
      :email,
      :phone,
      :linkedin,
      :facebook,
      :website,
      :english,
      :internship,
      :volunteering,
      :photo,
      search_words: []
      )
  end
end
