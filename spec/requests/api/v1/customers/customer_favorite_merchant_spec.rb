# require 'rails_helper'
#
# describe "Customer Merchant API" do
#   it "gets favorite merchant" do
#     customer = create(:customer)
#
#     invoices_list1 = create_list(:invoice_with_transactions, 4)
#     invoices_list2 = create_list(:invoice_with_transactions, 10)
#
#     customer.invoices << invoices_list2
#     customer.invoices << invoices_list1
#
#     merchant1 = create(:merchant)
#     merchant2 = create(:merchant, name: "Billy")
#
#     merchant1.invoices << invoices_list1
#     merchant2.invoices << invoices_list2
#
#     get "/api/v1/customers/#{customer.id}/favorite_merchant"
#
#     favorite_merch = JSON.parse(response.body)
#
#     expect(favorite_merch).to be_success
#   end
# end
