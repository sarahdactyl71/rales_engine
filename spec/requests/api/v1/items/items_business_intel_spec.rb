require 'rails_helper'

describe "Items Business Intelligence API" do
  it "returns the top x merchants ranked by total revenue" do
    create_list(:invoice_with_items, 3)

    get "/api/v1/items/most_revenue?quantity=3"

    expect(response).to be_success
    items = JSON.parse(response.body)
    #item = items.first
    expect(items.count).to eq(3)
  end

  it "returns the top x item instances ranked by total number sold" do
    create_list(:invoice_with_items, 3)

    get "/api/v1/items/most_items?quantity=2"

    expect(response).to be_success
    items = JSON.parse(response.body)
    #item = items.first
    expect(items.count).to eq(2)
  end
end
