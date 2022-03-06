class Tag < ApplicationRecord
  belongs_to :organisation
  belongs_to :search_word
end
