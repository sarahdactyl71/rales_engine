require 'rails_helper'

describe 'find random invoice_item' do
  it "returns a random invoice_item" do
    create(:invoice_item, quantity: '1')
    create(:invoice_item, quantity: '2')
    create(:invoice_item, quantity: '3')
    create(:invoice_item, quantity: '4')

    get "/api/v1/invoice_items/random"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
