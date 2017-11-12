FactoryBot.define do
  factory :book do
    title Faker::Book.title
    publisher
    author

  end

  # factory :book_with_formats do
  #   title Faker::Book.title
  #   publisher
  #   author
  #   book_format_types
  # end
end
