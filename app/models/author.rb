class Author < ApplicationRecord
  validates :first_name,
            :last_name,
            presence: true

  has_many :books

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
