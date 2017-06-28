require 'rails_helper'

describe "Invoice Items Invoice Relationship API" do
  it "sends a list of invoice items and items invoices" do
    invoice_item = create(:invoice_item)
    item = create(:item)
    invoice_item.item = item

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success
  end
end
