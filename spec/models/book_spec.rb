require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {create(:book)}

  describe "attributes" do
    it {expect(book).to respond_to(:title)}
  end

  describe "relationships" do
    it { should belong_to(:publisher) }
  end

  describe "validations" do
    it { should validate_presence_of(:title)}
  end
end
