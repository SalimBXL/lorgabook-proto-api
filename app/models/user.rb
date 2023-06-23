class User < ApplicationRecord
    belongs_to :groupe
    has_many :articles
    has_many :comments
    
    validates :fullname, :email, :groupe, presence: true
end
