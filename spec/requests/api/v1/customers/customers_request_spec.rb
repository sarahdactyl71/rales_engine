require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success
  end

  it "shows a single customer" do
    list = create_list(:customer, 3)
    customer = list.first

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_success
  end
end
