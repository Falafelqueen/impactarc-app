

class OrganisationsController < ApplicationController

  def index
    if params[:query].nil?
      if params[:size].nil? && params[:volunteering].nil? && params[:category][:category].nil?
        @organisations = Organisation.all
      elsif params[:size].present? && params[:volunteering].nil? && params[:category][:category].nil?
        @organisations = Organisation.filter_by_size(params[:size])
      elsif params[:volunteering].present? && params[:size].nil? && params[:category][:category].nil?
        if params[:volunteering]
          @organisations = Organisation.with_volunteering_opportunities
        end
      elsif params[:category][:category].present? &&  params[:size].nil? && params[:volunteering].nil?
        @organisations = Organisation.filter_by_category(params[:category][:category])
      elsif params[:category][:category].present? && params[:size].present? && params[:volunteering].nil?
        @organisations = Organisation.filter_by_size(params[:size]).filter_by_category(params[:category])
      elsif params[:category][:category].present? && params[:size].nil? && params[:volunteering].present?
           @organisations = Organisation.with_volunteering_opportunities.filter_by_category(params[:category][:category])
       else
          @organisations = Organisation.with_volunteering_opportunities.filter_by_size(params[:size]).filter_by_category(params[:category][:category])
     end

    else
      response = Organisation.search(params[:query])
      unless response.results.first.nil?
        @organisations = response.records.to_a
       end
    end
    @categories = Category.all
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
      :size,
      :photo,
      search_words: [],
      categories: []
    )
  end
  def category_params
    params.require(:category).permit(
      category: [],
    )
  end
end
