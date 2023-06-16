class Article < ApplicationRecord
  belongs_to :author
  belongs_to :article_category
  belongs_to :ressource
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :batch_number, presence: true

end
