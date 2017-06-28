require 'rails_helper'

describe 'find random customer' do
  it "returns a random customer" do
    create(:customer, first_name: 'Finn')
    create(:customer, first_name: 'Jake')
    create(:customer, first_name: 'Marceline')
    create(:customer, first_name: 'BMO')

    get "/api/v1/customers/random"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
