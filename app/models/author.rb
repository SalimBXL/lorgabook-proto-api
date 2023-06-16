class Author < ApplicationRecord
    has_many :articles
    has_many :comments
    belongs_to :groupe
    
    validates :fullname, presence: true
    validates :email, presence: true
    validates :groupe, presence: true

end
