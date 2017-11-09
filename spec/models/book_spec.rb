require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {create(:book)}

  describe "attributes" do
    it {expect(book).to respond_to(:title)}
  end
end
