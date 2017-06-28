require 'rails_helper'

describe "Merchants API" do
  it "sends a request to correct url" do
    create_list(:merchant, 3)

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_success

  end

  it "sends a list of merchants ranked by total revenue" do
    @merchants = create_list(:merchant_with_invoices_and_items, 3)
    binding.pry
    list = create_list(:merchant, 3)
    merchant = list.first

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_success
  end
end
