require "rails_helper"

describe 'find endpoints' do
  before :each do
    merchant = create(:merchant)
    description1 = "And that my leige is how we know the earth to be banana shaped"
    description2 = "What is the air speed velocity of an unladen swallow?"
    create(:item, merchant: merchant, description: description1, created_at: "2016-06-28 14:53:59 UTC",
    updated_at: "2017-06-28 14:53:59 UTC" )
    @item = create(:item, merchant: merchant, description: description2, unit_price: '2.2', created_at: "2016-06-28 14:53:59 UTC",
    updated_at: "2017-06-28 14:53:59 UTC")
  end

  it "returns a single item based on an id" do
      get "/api/v1/items/find?id=#{@item.id}"

      item_endpoint = JSON.parse(response.body)

      expect(item_endpoint['name']).to eq(@item.name)
    end

  it "returns a single item based on a name" do
    get "/api/v1/items/find?name=#{@item.name}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint['name']).to eq(@item.name)
  end

  it "returns a single item based on description" do
    get "/api/v1/items/find?description=#{@item.description}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint['name']).to eq(@item.name)
  end

  xit "returns a single item based on a unit price" do
    get "/api/v1/items/find?unit_price=#{@item.unit_price}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint['id']).to eq(@item.id)
  end

  it "returns a single item based on a created date" do
    get "/api/v1/items/find?created_at=#{@item.created_at}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint['name']).to eq(@item.name)
  end

  it "returns a single item based on updated date" do
    get "/api/v1/items/find?updated_at=#{@item.updated_at}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint['name']).to eq(@item.name)
  end
end

describe 'find_all endpoints' do
  before :each do
    merchant = create(:merchant)
    @item1 = create(:item,
                    merchant: merchant,
                    name: "Lady Rainicorn",
                    unit_price: 1,
                    description: "Lumpy Space",
                    created_at: "2016-06-28 14:53:59 UTC",
                    updated_at: "2014-06-28 14:53:59 UTC")
    @item2 = create(:item,
                    merchant: merchant,
                    name: "BMO",
                    unit_price: 1,
                    description: "Treehouse",
                    created_at: "2016-06-28 14:53:59 UTC",
                    updated_at: "2017-06-28 14:53:59 UTC")
    @item3 = create(:item,
                    merchant: merchant,
                    name: "BMO",
                    unit_price: 2,
                    description: "Lumpy Space",
                    created_at: "2015-06-28 14:53:59 UTC",
                    updated_at: "2017-06-28 14:53:59 UTC")
  end

  it "returns a collection of items based on an id" do
    get "/api/v1/items/find_all?id=#{@item1.id}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint.first['id']).to eq(@item1.id)
  end

  it "returns a collection of items based on name" do
    get "/api/v1/items/find_all?name=#{@item2.name}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint.count).to eq(2)
    expect(item_endpoint.first['id']).to eq(@item2.id)
  end

  it "returns a collection of items based on unit_price" do
    get "/api/v1/items/find_all?unit_price=#{@item1.unit_price.to_f/100}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint.count).to eq(2)
    expect(item_endpoint.first['id']).to eq(@item1.id)
  end

  it 'returns a collection of items based on description' do
    get "/api/v1/items/find_all?description=#{@item1.description}"

    item_endpoint = JSON.parse(response.body)

    expect(item_endpoint.count).to eq(2)
    expect(item_endpoint.first['id']).to eq(@item1.id)
  end

  it "returns a collection of items based on a created date" do
      get "/api/v1/items/find_all?created_at=#{@item1.created_at}"

      item_endpoint = JSON.parse(response.body)

      expect(item_endpoint.count).to eq(2)
      expect(item_endpoint.first['id']).to eq(@item1.id)
      expect(item_endpoint.last['id']).to eq(@item2.id)
    end

    it "returns a collection of items based on updated date" do
      get "/api/v1/items/find_all?updated_at=#{@item2.updated_at}"

      item_endpoint = JSON.parse(response.body)

      expect(item_endpoint.count).to eq(2)
      expect(item_endpoint.first['id']).to eq(@item2.id)
      expect(item_endpoint.last['id']).to eq(@item3.id)
    end


end
