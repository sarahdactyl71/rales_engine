require 'rails_helper'

describe 'find random merchant' do
  it "returns a random merchant" do
    create(:merchant, name: 'Finn the Human')
    create(:merchant, name: 'Jake the Dog')
    create(:merchant, name: 'Princess Bubblegum')
    create(:merchant, name: 'Lumpy Space Princess')

    get "/api/v1/merchants/random"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
