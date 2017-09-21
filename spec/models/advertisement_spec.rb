require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) {Advertisement.create!(title: "New ad Title", body: "New ad Body", price: 25)}

  describe "attributes" do
    it "Has title, body, and price attributes" do
      expect(advertisement).to have_attributes(title: "New ad Title", body: "New ad Body", price: 25)
    end
  end

end
