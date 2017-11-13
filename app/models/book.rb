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
    self.book_reviews.average(:rating)
  end

  def self.search(args)

    Book.select('*')
        .joins(:author)
        .where('authors.last_name' => args)
  end

end
