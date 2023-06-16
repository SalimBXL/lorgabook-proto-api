class Groupe < ApplicationRecord
    has_many :authors
    
    validates :name, presence: true
    validates :description, presence: true
end
