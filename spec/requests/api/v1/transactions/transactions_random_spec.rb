require 'rails_helper'

describe 'find random transaction' do
  it "returns a random transaction" do
    create(:transaction, credit_card_number: '12345')
    create(:transaction, credit_card_number: '67891')
    create(:transaction, credit_card_number: '11123')
    create(:transaction, credit_card_number: '14151')

    get "/api/v1/transactions/random"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
