class Resource < ApplicationRecord
  belongs_to :resource_category
  belongs_to :resource_location
  belongs_to :reference_person, class_name: "Author"
  has_many :articles

  validates :name, presence: true
  validates :description, presence: true
end
