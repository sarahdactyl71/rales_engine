require 'rails_helper'

describe "Merchants Business Intelligence API" do
  it "returns the top x merchants ranked by total revenue" do
    @merchants = create_list(:merchant_with_invoices_and_items, 3)

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response).to be_success
    merchants = JSON.parse(response.body)
    merchant = merchants.first
    expect(merchants.count).to eq(2)
    expect(@merchants.pluck(:id)).to include(merchant["id"])
  end

  it "returns the top x merchants ranked by total items sold" do
    @merchants = create_list(:merchant_with_invoices_and_items, 3)

    get "/api/v1/merchants/most_items?quantity=3"

    expect(response).to be_success
    merchants = JSON.parse(response.body)
    merchant = merchants.first
    expect(merchants.count).to eq(3)
    expect(@merchants.pluck(:id)).to include(merchant["id"])
  end
end
