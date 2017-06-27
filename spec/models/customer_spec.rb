require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "customer can be created" do
    customer = build(:customer, first_name: "Joe", last_name: "Shmoe")
    invoices = create_list(:invoice, 3)

    customer.invoices << invoices

    expect(customer.first_name).to eq("Joe")
    expect(customer.last_name).to eq("Shmoe")
    expect(customer.invoices.length).to eq(3)
  end
end
