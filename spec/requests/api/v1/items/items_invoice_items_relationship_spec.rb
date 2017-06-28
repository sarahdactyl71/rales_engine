require 'rails_helper'

describe "Items Invoices Relationship API" do
  it "returns a collection of associated items" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant: merchant, customer: customer)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)
    invoice_items1 = create_list(:invoice_item, 3, item: item1, invoice: invoice)
    invoice_items2 = create_list(:invoice_item, 3, item: item2, invoice: invoice)
    id = item1.id

    get "/api/v1/items/#{id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(invoice_items1.count)
    expect(invoice_items.first["id"]).to eq(invoice_items1.first.id)
  end
end
