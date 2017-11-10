class BookFormat < ApplicationRecord
  belongs_to :book_format_type
  belongs_to :book
end
