# require 'rails_helper'
#
# describe "Invoices Invoice Items Relationship API" do
#   it "sends a list of invoices and thier invoice items" do
#     invoice = create(:invoice)
#     invoice_items_list = create_list(:invoice_item, 10)
#     invoice.invoice_items << invoice_items_list
#
#     get "/api/v1/invoices/#{invoice.id}/invoice_items"
#
#     expect(response).to be_success
#   end
# end
