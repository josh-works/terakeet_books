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

  def self.search(query, options = {})
    return self.search_by_title(query) if options.has_key?(:title_only)
    
    parse_options(options)
    search_by_author(query)
  end

  def self.parse_options(options)
    # binding.pry
    if options != nil
      # do something
    end
  end

  def self.search_by_author(author_name)
    Book.joins(:author)
        .where('authors.last_name ILIKE ?', author_name)
  end

  def self.search_by_publisher(publisher_name)
    Book.joins(:publisher)
        .where('publishers.title ILIKE ?', publisher_name)
  end

  def self.search_by_title(title)
    Book.where("title ILIKE ?", "%#{title}%")
  end

end
