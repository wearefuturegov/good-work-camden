class Service < ApplicationRecord
    has_many :service_tags
    has_many :tags, through: :service_tags
end
