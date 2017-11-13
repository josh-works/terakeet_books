require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {create(:book)}

  describe "attributes" do
    it {expect(book).to respond_to(:title)}
  end

  describe "relationships" do
    it { should belong_to(:publisher) }
    it { should have_many(:book_formats)}
    it { should have_many(:book_format_types).through(:book_formats)}
  end

  describe "validations" do
    it { should validate_presence_of(:title)}
    it {should validate_presence_of(:author_id)}
    it {should validate_presence_of(:publisher_id)}
  end

  describe "#book_format_types" do
    it "should return collection of book_format_types" do
      book = create(:book)
      2.times do |i|
        BookFormatType.create!(
          name: ["Hardcover","Softcover"][i]
        )
      end

      BookFormat.create!(
        book_id: book.id,
        book_format_type_id: BookFormatType.first.id
      )
      BookFormat.create!(
        book_id: book.id,
        book_format_type_id: BookFormatType.last.id
      )

      expect(book.book_format_types.count).to eq(2)
      expect(book.book_format_types.pluck(:name)).to include("Hardcover", "Softcover")
    end
  end

  describe "#author_name" do
    it "should return author's name in 'lastname, firstname' format" do
      book = create(:book)
      author_name = "#{book.author.last_name}, #{book.author.first_name}"
      expect(book.author_name).to eq(author_name)
    end
  end

  describe "#average_rating" do
    it "should return mean of all book reviews of book to one decimal" do
      book = create(:book)
      4.times do |i|
        BookReview.create!(
          book_id: book.id,
          rating: i
        )
      end
      expect(book.average_rating).to eq(1.5)
    end
  end
  
end
