class Service < ApplicationRecord
  has_many :service_tags, dependent: :delete_all
  has_many :tags, through: :service_tags, dependent: :delete_all

  geocoded_by :postcode
  after_validation :geocode
end
