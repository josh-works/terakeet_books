require 'rails_helper'

RSpec.describe Book, type: :model do

  describe "Book::search" do
    it "should return books matched on author's last name" do
      author = Author.create!(
        first_name: "Firstname",
        last_name: "Lastname"
      )
      book = create(:book)
      book.update_attribute(:author_id, author.id)

      search_results = Book.search("Lastname")

      expect(search_results.count).to eq(1)
      expect(search_results[0].author.last_name).to eq("Lastname")
    end

    it "should return books matched on author's last name, case_insensitive" do
      author = Author.create!(
        first_name: "Firstname",
        last_name: "Lastname"
      )
      book = create(:book)
      book.update_attribute(:author_id, author.id)

      search_results = Book.search("lastname")

      expect(search_results.count).to eq(1)
      expect(search_results[0].author.last_name).to eq("Lastname")
    end

    it "should return books matched on publisher name" do
      book = create(:book)
      publisher = Publisher.create!(
        title: "Book Publishing LTD"
      )
      book.update_attribute(:publisher_id, publisher.id)
      search_results = Book.search("Book Publishing LTD", title_only: false)
      expect(search_results.count).to eq(1)
    end

    it "should return books matched on title" do
      book = create(:book)
      book.update_attribute(:title, "A Book to Read")

      search_results = Book.search("a book", title_only: true)
      expect(search_results.count).to eq(1)
      expect(search_results.first.title).to eq("A Book to Read")
    end
  end

  # sad paths
  # partial search terms for authors
end
