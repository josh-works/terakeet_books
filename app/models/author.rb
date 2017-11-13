class Author < ApplicationRecord
  validates :first_name,
            :last_name,
            presence: true

  validates_uniqueness_of :first_name, scope: [:first_name, :last_name],
                          message: "FULL NAME has already been taken"
  has_many :books


  def name
    "#{self.first_name} #{self.last_name}"
  end
end
