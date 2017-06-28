require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)
    first_merch = merchants.first
    expect(merchants.count).to eq(3)
    expect(first_merch).to have_key("name")
    expect(first_merch["name"]).to be_a String
  end
end
