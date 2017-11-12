FactoryBot.define do
  factory :book do
    title Faker::Book.title
    publisher
    author
  end

end
