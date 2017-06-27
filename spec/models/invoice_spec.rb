require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "invoice can be created" do
    merchant = build(:merchant, name: "Bob")
    customer = build(:customer, first_name: "Karl")
    invoice = build(:invoice, merchant: nil, customer: nil)
    invoice.merchant = merchant
    invoice.customer = customer

    expect(invoice.status).to eq("shipped")
    expect(invoice.merchant.name).to eq("Bob")
    expect(invoice.customer.first_name).to eq("Karl")
  end
end
