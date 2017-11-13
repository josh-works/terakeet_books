require 'rails_helper'

RSpec.describe Book, type: :model do

  describe "Book::search" do
    it "should return books matched on author's last name" do
      author = Author.create!(
        first_name: "firstname",
        last_name: "lastname"
      )
      book = create(:book)
      book.update_attribute(:author_id, author.id)
      search_results = Book.search("lastname")
      expect(search_results.count).to eq(1)
      expect(search_results[0].author.last_name).to eq("lastname")

    end
  end
end
