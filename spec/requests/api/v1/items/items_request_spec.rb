require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    #binding.pry
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success
  end

  it "shows a single item" do
    list = create_list(:item, 3)
    item = list.first

    get "/api/v1/items/#{item.id}"

    expect(response).to be_success
  end
end
