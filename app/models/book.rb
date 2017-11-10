class Book < ApplicationRecord

  validates :title,
            :publisher_id,
            :author_id,
            presence: true

  belongs_to :publisher
  belongs_to :author

end
