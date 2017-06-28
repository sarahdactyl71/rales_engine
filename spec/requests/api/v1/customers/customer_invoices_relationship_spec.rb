require 'rails_helper'

describe "Customers Invoices Relationship API" do
  it "sends a list of customers invoices" do
    customer = create(:customer)
    invoices_list = create_list(:invoice, 10)
    customer.invoices << invoices_list

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success
  end
end
