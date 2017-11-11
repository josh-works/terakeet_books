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

  
end
