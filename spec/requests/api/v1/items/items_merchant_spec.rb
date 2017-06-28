require 'rails_helper'

describe "Items Merchant Relationship API" do
  it "returns associated merchant" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    items = create_list(:item, 3, merchant: merchant1)
    id = items.first.id
    get "/api/v1/items/#{id}/merchant"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.first.merchant).to eq(merchant1)
    expect(items.first.merchant).to_not eq(merchant2)
  end
end
