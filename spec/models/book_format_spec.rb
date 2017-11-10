require 'rails_helper'

RSpec.describe BookFormat, type: :model do
  let(:book_format) {create(:book_format)}

  describe "associations" do
    it { should belong_to(:book)}
    it { should belong_to(:book_format_type)}
  end
end
