require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) {create(:author)}

  describe "attributes" do
    it {expect(author).to respond_to(:first_name)}
    it {expect(author).to respond_to(:last_name)}
  end

  describe "relationships" do
    it { should have_many(:books)}
  end
end
