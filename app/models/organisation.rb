class Organisation < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/ }
  has_one_attached :photo
  has_many :tags
  has_many :search_words, through: :tags
  has_many :organisation_categories
  has_many :categories, through: :organisation_categories
  has_many :user_organisations
  has_many :users, through: :user_organisations
  accepts_nested_attributes_for :categories

  include Searchable

  scope :english_speaking, -> { where(english: true) }
  scope :with_volunteering_opportunities, -> { where(volunteering: true) }
  scope :with_internship_opportunities, -> { where(internship: true) }


  def self.filter_by_category(params)
    big_array = params.map do |cat|
      Organisation.joins(categories: [:organisation_categories]).where(organisation_categories:{category_id: cat}).uniq
    end
    flat_big_array = big_array.flatten
    id_array = flat_big_array.map do |e|
      e.id
    end
    amount_of_categories = params.count
    if amount_of_categories > 1
      match_array = id_array.find_all{|e| id_array.count(e) == amount_of_categories}.uniq
      self.where(id: match_array)
    else
      self.where(id: id_array)
    end
  end

    def self.filter_by_size(size)
      self.where(size: size)
    end

end
