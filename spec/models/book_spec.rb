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
      # book = create(:book_with_formats)
      # book = create(:book)
      # formats = create(:book_format_types)
      # formats = several book formats
      # book.formats.push[formats]
      # expect(book.book_format_types).to eq(formats)
    end
  end

  describe "#author_name" do
    it "should return author's name in 'lastname, firstname' format" do
      book = create(:book)
      author_name = "#{book.author.last_name}, #{book.author.last_name}"
      expect(book.author_name).to eq(author_name)
    end
  end


end
