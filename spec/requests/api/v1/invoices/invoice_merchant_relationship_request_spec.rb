require 'rails_helper'

describe "Invoice Merchant Relationship API" do
  it "sends the merchant of an invoice" do
    invoice = create(:invoice)
    merchant = create(:merchant)
    invoice.merchant = merchant

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success
  end
end
