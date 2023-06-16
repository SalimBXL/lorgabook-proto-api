class ResourceCategory < ApplicationRecord
    has_many :resources

    validates :name, presence: true
    validates :description, presence: true
end
