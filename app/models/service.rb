class Service < ApplicationRecord
    has_many :service_tags, dependent: :delete_all
    has_many :tags, through: :service_tags, dependent: :delete_all
end
