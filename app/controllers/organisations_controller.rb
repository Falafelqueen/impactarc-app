class OrganisationsController < ApplicationController
  def index
    if params[:query].nil?
      @organisations = Organisation.all
    else
      response = Organisation.search(params[:query])
      unless response.results.first.nil?
        @organisations = response.results.map do |r|
            r._source
        end

       end
    end
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
      if @organisation.save!

        params[:organisation][:search_words][:search_word].each do |entry|
          unless entry.nil? || entry = ""
          search_word = SearchWord.find_by(search_word: entry)
          Tag.create(organisation_id: @organisation.id, search_word_id: search_word.id )
          end
        end
        params[:organisation][:categories][:name].each do |entry|
          unless entry.nil? || entry == ""
            category = Category.find_by(name: entry)
            OrganisationCategory.create(organisation_id: @organisation.id, category_id: category.id)
          end
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
      search_words: [],
      categories: []
      )
  end
end
