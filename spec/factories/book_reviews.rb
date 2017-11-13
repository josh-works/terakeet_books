FactoryBot.define do
  factory :book_review do
    rating (1..5).to_a.sample
    book
  end
  
end
