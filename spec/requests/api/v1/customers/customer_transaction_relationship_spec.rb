require 'rails_helper'

describe "customer transaction relationship API" do
  it "can send list of customer transaction data" do
    customer = create(:customer)
    invoices_list = create_list(:invoice, 10)
    invoice = invoices_list.first
    customer.invoices << invoice

    transactions = create_list(:transaction, 10)
    invoice.transactions << transactions

    get "/api/v1/customers/#{customer.id}/transactions"

    customer_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer_transactions.count).to eq(10)
  end
end
