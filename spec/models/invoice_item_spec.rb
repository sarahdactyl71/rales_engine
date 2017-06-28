require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it "invoice_item can be created" do
    invoice_item = build(:invoice_item, quantity: 5, unit_price: 3.5)

    expect(invoice_item.quantity).to eq(5)
    expect(invoice_item.unit_price).to eq(3.5)
  end
end
