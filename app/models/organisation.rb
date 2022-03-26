class Organisation < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/ }
  has_one_attached :photo
  has_many :tags
  has_many :search_words, through: :tags
  has_many :organisation_categories
  has_many :categories, through: :organisation_categories
  accepts_nested_attributes_for :categories

  include Searchable

  scope :english_speaking, -> { where(english: true) }
  scope :with_volunteering_opportunities, -> { where(volunteering: true) }
  scope :with_internship_opportunities, -> { where(internship: true) }
  scope :small, -> { where(size: "small") }
  scope :medium, -> { where(size: "medium") }
  scope :large, -> { where(size: "large") }
  scope :in_human_rights_category, -> { where(categories.inlude("human rights"))}


  def self.filter_by_category(categor)
      Organisation.joins(:categories).where(category: {name:categor})
  end

  def self.filter_by_size(size)
     self.where(size: size)
  end

end
