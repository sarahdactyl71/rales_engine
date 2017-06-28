require 'rails_helper'

describe "Invoice Items Invoice Relationship API" do
  it "sends a invoice item's invoice" do
    invoice_item = create(:invoice_item)
    invoice = create(:invoice)
    invoice_item.invoice = invoice

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success
  end
end
