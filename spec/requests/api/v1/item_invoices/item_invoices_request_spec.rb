require 'rails_helper'

describe "Invoice Items API" do
  it "sends the joins table for invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_success
  end

  it "shows a single invoice_item" do
    list = create_list(:invoice_item, 3)
    invoice_item = list.first

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_success
  end
end
