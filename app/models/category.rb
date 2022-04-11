class Category < ApplicationRecord
  has_many :organisation_categories
  has_many :organisations, through: :organisation_categories

  scope :main, -> { where(main: true) }
  scope :other, -> { where(main: false) }
end
