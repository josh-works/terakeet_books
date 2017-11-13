FactoryBot.define do
  factory :book_format_type do
    name {["Hardcover","Softcover","Kindle","PDF"].sample}
    physical false
  end
end
