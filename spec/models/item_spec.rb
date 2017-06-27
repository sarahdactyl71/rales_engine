require 'rails_helper'

RSpec.describe Item, type: :model do
  it "item can be created" do
    item = build(:item, name: "Saber", description: "Rad", unit_price: 500)
    merchant = build(:merchant, name: "Bob")
    item.merchant = merchant

    invoices = create_list(:invoice, 3)
    item.invoices << invoices

    expect(item.name).to eq("Saber")
    expect(item.description).to eq("Rad")
    expect(item.unit_price).to eq(500)
    expect(item.merchant.name).to eq("Bob")
    expect(item.invoices.length).to eq(3)
  end
end
