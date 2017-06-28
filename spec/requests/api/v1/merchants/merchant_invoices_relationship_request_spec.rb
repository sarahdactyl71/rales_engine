require 'rails_helper'

describe "Merchant Invoices Relationship API" do
  it "sends a list of merchants invoices" do
    merchant = create(:merchant)
    invoices_list = create_list(:invoice, 10)
    merchant.invoices << invoices_list

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_success
  end
end
