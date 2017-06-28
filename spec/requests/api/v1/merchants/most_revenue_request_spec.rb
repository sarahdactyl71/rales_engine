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

  it "returns the total revenue for date x across all merchants" do
    merchants = create_list(:merchant_with_invoices_and_items, 3)
    invoice = merchants.first.invoices.first
    invoice.update(created_at: DateTime.yesterday)
    date = merchants.first.invoices.first.created_at.strftime("%Y-%m-%d %H:%M:%S")

    get "/api/v1/merchants/revenue", params: {date: date}
    expect(response).to be_success
    revenue = JSON.parse(response.body)
    expect(revenue["total_revenue"]).to eq("40.00")
  end
end
