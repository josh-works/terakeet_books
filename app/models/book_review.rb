class BookReview < ApplicationRecord

  belongs_to :book

  validates :rating, presence: true
end
