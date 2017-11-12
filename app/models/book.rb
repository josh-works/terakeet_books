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
    "#{self.author.last_name}, #{self.author.last_name}"
  end

end
