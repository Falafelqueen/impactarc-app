class Organisation < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/ }
  has_one_attached :photo
  has_many :tags
  has_many :search_words, through: :tags
end
