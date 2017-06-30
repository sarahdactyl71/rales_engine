require 'rails_helper'

describe "Invoices Items Relationship API" do
  it "sends a list of invoice items" do
    invoice = create(:invoice)
    items_list = create_list(:item, 10)
    invoice.items << items_list

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success
  end
end
