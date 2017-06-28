require 'rails_helper'

describe "Transactions Invoices API" do
  it "returns the associated invoice" do
     merchant = create(:merchant)
     customer = create(:customer)
     invoice1 = create(:invoice, merchant: merchant, customer: customer)
     invoice2 = create(:invoice, merchant: merchant, customer: customer)
     transactions = create_list(:transaction, 3, invoice: invoice1)
     id = transactions.first.id

     get "/api/v1/transactions/#{id}/invoice"

     invoice = JSON.parse(response.body)

     expect(response).to be_success
     expect(transactions.first.invoice).to eq(invoice1)
     expect(transactions.first.invoice).to_not eq(invoice2)
   end
end
