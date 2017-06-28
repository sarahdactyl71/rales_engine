require 'rails_helper'

describe "Invoice Customer Relationship API" do
  it "sends the customer of an invoice" do
    invoice = create(:invoice)
    customer = create(:customer)
    invoice.customer = customer

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success
  end
end
