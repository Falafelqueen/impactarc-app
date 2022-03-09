class Category < ApplicationRecord
  has_many :organisation_categories
  has_many :organisations, through: :organisation_categories
end
