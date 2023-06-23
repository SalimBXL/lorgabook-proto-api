class Resource < ApplicationRecord
  belongs_to :resource_category
  belongs_to :resource_location
  belongs_to :reference_person, class_name: "User"
  has_many :articles

  validates :name, presence: true
  validates :resource_category, presence: true
  validates :resource_location, presence: true
  validates :reference_person, presence: true
end
