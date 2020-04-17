class Tag < ApplicationRecord
    has_many :service_tags
    has_many :services, through: :service_tags
end
