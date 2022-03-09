class OrganisationCategory < ApplicationRecord
  belongs_to :organisation
  belongs_to :category
end
