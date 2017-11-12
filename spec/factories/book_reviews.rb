FactoryBot.define do
  factory :book_review do
    rating (1..5).to_a.sample
    book
  end


  # factory :book_with_three_reviews do
  #   3.times do |n|
  #     rating (1..5).to_a.sample
  #     book
  #   end
  # end
end
