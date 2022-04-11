

class OrganisationsController < ApplicationController

  def index
    # no search
    if params[:query].nil?

      if params[:size].nil? && params[:volunteering].nil? && params[:category_id].nil?
        @organisations = Organisation.all
      elsif params[:size].present? && params[:volunteering].nil? && params[:category_id].nil?
        @organisations = Organisation.filter_by_size(params[:size])
      elsif params[:volunteering].present? && params[:size].nil? && params[:category_id].nil?
        if params[:volunteering]
          @organisations = Organisation.with_volunteering_opportunities
        end
      elsif params[:category_id].present? &&  params[:size].nil? && params[:volunteering].nil?
        @organisations = Organisation.filter_by_category(params[:category_id])
      elsif params[:category_id].present? && params[:size].present? && params[:volunteering].nil?
        @organisations = Organisation.filter_by_size(params[:size]).filter_by_category(params[:category_id])
      elsif params[:category_id].present? && params[:size].nil? && params[:volunteering].present?
           @organisations = Organisation.with_volunteering_opportunities.filter_by_category(params[:category_id])
      elsif  params[:category_id].nil? && params[:size].present? && params[:volunteering].present?
            @organisations = Organisation.with_volunteering_opportunities.filter_by_size(params[:size])
       else
          @organisations = Organisation.with_volunteering_opportunities.filter_by_size(params[:size]).filter_by_category(params[:category_id])
     end

    else
      #when the index is accessed through search bar
      response = Organisation.search(params[:query])
      unless response.results.first.nil?
        @organisations = response.records.to_a
      end

    end

    filter_bar(params)
    @categories = Category.all
    @main_categories = Category.main
    @other_categories = Category.other
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
        params[:categories][:name].each do |entry|
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

  def filter_bar(params)
      @filters = []

      if params[:size].present?
        @filters << params[:size]
      end
      if params[:volunteering].present?
        @filters << "volunteer opportunities"
      end
      if params[:category_id].present?
        params[:category_id].each do |category_id|
          @filters << Category.find(category_id).name
        end
      end
      return @filters
  end

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
      :category,
      search_words: [],
      categories: []
    )
  end

end
