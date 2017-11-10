require 'rails_helper'

RSpec.describe BookFormatType, type: :model do
  let(:book_format_type) { create(:book_format_type)}

  describe "associations" do
    it { should have_many(:book_formats)}
    it { should have_many(:books).through(:book_formats)}
  end

end
