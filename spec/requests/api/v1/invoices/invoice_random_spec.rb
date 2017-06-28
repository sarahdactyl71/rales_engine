require 'rails_helper'

describe 'find random invoice' do
  it "returns a random invoice" do
    create(:invoice, status: '1')
    create(:invoice, status: '0')
    create(:invoice, status: '1')
    create(:invoice, status: '0')

    get "/api/v1/invoices/random"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
