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

  describe "validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
  end

  describe "#name" do
      it "should concat first_name and last_name" do
      author = create(:author)
      name = "#{author.first_name} #{author.last_name}"

      expect(author.name).to eq(name)
    end
  end
end
