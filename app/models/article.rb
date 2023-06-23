class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_category
  belongs_to :resource
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :batch_number, presence: true
  validates :user, presence: true
  validates :article_category, presence: true
end
