require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/items'

    expect(response).to be_success
  end

  it "shows a single invoice" do
    list = create_list(:invoice, 3)
    invoice = list.first

    get "/api/v1/invoices/#{invoice.id}"

    expect(response).to be_success
  end
end
