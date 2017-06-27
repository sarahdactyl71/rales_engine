require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_success
  end

  it "shows a single transaction" do
    list = create_list(:transaction, 3)
    transaction = list.first

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_success
  end
end
