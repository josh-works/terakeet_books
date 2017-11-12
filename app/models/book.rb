class Book < ApplicationRecord

  validates :title,
            :publisher_id,
            :author_id,
            presence: true

  belongs_to :publisher
  belongs_to :author

  has_many :book_formats
  has_many :book_format_types, through: :book_formats

  has_many :book_reviews


  def author_name
    "#{self.author.last_name}, #{self.author.first_name}"
  end

  def average_rating
    total = self.book_reviews.pluck(:rating).reduce(:+)
    count = self.book_reviews.count
    (total.to_f / count).round(1)
  end

end
