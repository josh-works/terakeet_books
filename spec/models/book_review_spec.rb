require 'rails_helper'

RSpec.describe BookReview, type: :model do
  let(:book_review) { create(:book_review) }

  describe "associations" do
    it { should belong_to(:book) }
  end

  describe "validations" do
    it { should validate_presence_of(:rating) }
  end
end
