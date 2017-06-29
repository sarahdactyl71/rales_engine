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
  end

  it "returns the total revenue for that merchant across all transactions" do
    @merchants = create_list(:merchant_with_transactions, 3)

    get "/api/v1/merchants/#{@merchants.first.id}/revenue"

    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(@merchants.pluck(:id)).to include(merchant["id"])
  end

  it "returns the total revenue for that merchant for a specific invoice date x" do
    @merchants = create_list(:merchant_with_invoices_and_items, 3)
    invoice = @merchants.first.invoices.first
    invoice.update(created_at: Date.today)
    date = Date.today.to_datetime.to_formatted_s

    get "/api/v1/merchants/#{@merchants.first.id}/revenue?date=#{date}"

    expect(response).to be_success
  end

  it "returns the customer who has conducted the most total number of successful transactions" do
    @merchants = create_list(:merchant_with_transactions, 3)
    merchant = @merchants.first

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(@merchants.pluck(:id)).to include(merchant["id"])
  end
end
