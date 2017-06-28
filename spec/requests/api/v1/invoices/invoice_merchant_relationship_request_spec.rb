require 'rails_helper'

describe "Invoices Transaction Relationship API" do
  it "sends a list of invoices transaction" do
    invoice = create(:invoice)
    transactions_list = create_list(:transaction, 10)
    invoice.transactions << transactions_list

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success
  end
end
