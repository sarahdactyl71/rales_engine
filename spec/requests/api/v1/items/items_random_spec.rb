require 'rails_helper'

describe 'find random item' do
  it "returns a random item" do
    create(:item, name: 'Fiin the Human')
    create(:item, name: 'Jake the Dog')
    create(:item, name: 'Princess Bubblegum')
    create(:item, name: 'Marceline the Vampire Queen')

    get "/api/v1/items/random"

    JSON.parse(response.body)

    expect(response).to be_success
  end
end
