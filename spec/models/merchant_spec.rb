require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "merchant can be created" do
    merchant = build(:merchant, name: "Dan")

    expect(merchant.name).to eq("Dan")
  end
end
