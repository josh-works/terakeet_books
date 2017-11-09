require 'rails_helper'

RSpec.describe Publisher, type: :model do
  let(:publisher) {create(:publisher)}

  describe "attributes" do
    it {expect(publisher).to respond_to(:title)}
  end
end
