require 'rails_helper'

describe "Merchants Items Relationship API" do
  it "sends a list of merchants items" do
    merchant = create(:merchant)
    items_list = create_list(:item, 10)
    merchant.items << items_list

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_success
  end
end
