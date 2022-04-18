

class OrganisationsController < ApplicationController

  def index
    # no search
    if params[:query].nil?

      if params[:size].nil? && params[:volunteering].nil? && params[:category_id].nil? && params[:english].nil? && params[:internship].nil?
        @organisations = Organisation.page(params[:page]).order(:name)
        #if there is one criteria
      elsif params[:size].present? && params[:volunteering].nil? && params[:category_id].nil? && params[:english].nil? && params[:internship].nil?
        @organisations = Organisation.filter_by_size(params[:size]).page(params[:page])
      elsif params[:volunteering].present? && params[:size].nil? && params[:category_id].nil? && params[:english].nil? && params[:internship].nil?
          @organisations = Organisation.with_volunteering_opportunities.page(params[:page])
      elsif params[:category_id].present? &&  params[:size].nil? && params[:volunteering].nil? && params[:english].nil? && params[:internship].nil?
        @organisations = Organisation.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:english].present? && params[:size].nil? && params[:volunteering].nil? && params[:category_id].nil? && params[:internship].nil?
        @organisations = Organisation.english_speaking.page(params[:page])
      elsif params[:internship].present? && params[:size].nil? && params[:volunteering].nil? && params[:category_id].nil? && params[:english].nil?
        @organisations = Organisation.with_internship_opportunities.page(params[:page])
        #if there is 2 filters
      elsif params[:category_id].present? && params[:english].present? && params[:size].nil? && params[:volunteering].nil? && params[:internship].nil?
        @organisations = Organisation.english_speaking.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:size].present? && params[:volunteering].nil? && params[:english].nil? && params[:internship].nil?
        @organisations = Organisation.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].nil? && params[:size].nil? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.with_volunteering_opportunities.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].nil? && params[:size].nil? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].nil? && params[:english].present? && params[:size].present? && params[:volunteering].nil? && params[:internship].nil?
        @organisations = Organisation.english_speaking.filter_by_size(params[:size]).page(params[:page])
      elsif params[:category_id].nil? && params[:english].present? && params[:size].nil? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.english_speaking.with_volunteering_opportunities.page(params[:page])
      elsif params[:category_id].nil? && params[:english].present? && params[:size].nil? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.english_speaking.with_internship_opportunities.page(params[:page])
      elsif params[:category_id].nil? && params[:english].nil? && params[:size].present? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.filter_by_size(params[:size]).with_volunteering_opportunities.page(params[:page])
      elsif params[:category_id].nil? && params[:english].nil? && params[:size].present? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.filter_by_size(params[:size]).with_internship_opportunities.page(params[:page])
      elsif params[:category_id].nil? && params[:english].nil? && params[:size].nil? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.with_volunteering_opportunities.with_internship_opportunities.page(params[:page])
        #if there is 3 filters
      elsif params[:category_id].present? && params[:english].present? && params[:size].present? && params[:volunteering].nil? && params[:internship].nil?
        @organisations = Organisation.english_speaking.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].present? && params[:size].nil? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.english_speaking.with_volunteering_opportunities.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].present? && params[:size].nil? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.english_speaking.with_internship_opportunities.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].nil? && params[:size].present? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.with_volunteering_opportunities.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].nil? && params[:size].present? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].nil? && params[:size].nil? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.with_volunteering_opportunities.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].nil? && params[:english].present? && params[:size].present? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.english_speaking.with_volunteering_opportunities.filter_by_size(params[:size]).page(params[:page])
      elsif params[:category_id].nil? && params[:english].present? && params[:size].present? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.english_speaking.with_internship_opportunities.filter_by_size(params[:size]).page(params[:page])
      elsif params[:category_id].nil? && params[:english].present? && params[:size].nil? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.english_speaking.with_internship_opportunities.with_volunteering_opportunities.page(params[:page])
      elsif params[:category_id].nil? && params[:english].nil? && params[:size].present? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.with_volunteering_opportunities.filter_by_size(params[:size]).page(params[:page])
        #if there is 4 filters
      elsif params[:category_id].nil? && params[:english].present? && params[:size].present? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.english_speaking.with_internship_opportunities.with_volunteering_opportunities.filter_by_size(params[:size]).page(params[:page])
      elsif params[:category_id].present? && params[:english].nil? && params[:size].present? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.with_volunteering_opportunities.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].present? && params[:size].nil? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.with_volunteering_opportunities.english_speaking.filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].present? && params[:size].present? && params[:volunteering].nil? && params[:internship].present?
        @organisations = Organisation.with_internship_opportunities.english_speaking.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
      elsif params[:category_id].present? && params[:english].present? && params[:size].present? && params[:volunteering].present? && params[:internship].nil?
        @organisations = Organisation.with_volunteering_opportunities.english_speaking.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
        #if is 5 filters
      elsif params[:category_id].present? && params[:english].present? && params[:size].present? && params[:volunteering].present? && params[:internship].present?
        @organisations = Organisation.english_speaking.with_volunteering_opportunities.english_speaking.filter_by_size(params[:size]).filter_by_category(params[:category_id]).page(params[:page])
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
      if params[:english].present?
        @filters << "english"
      end
      if params[:internship].present?
        @filters << "internship opportunities"
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
