require "rails_helper"

describe 'find endpoints' do
    before :each do
      create(:merchant, name: 'Finn the Human')
      @merchant = create(:merchant, name: 'Jake the Dog', created_at: "2016-06-28 14:53:59 UTC",
      updated_at: "2017-06-28 14:53:59 UTC")
    end

    it "returns a single merchant based on an id" do
      get "/api/v1/merchants/find?id=#{@merchant.id}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint['name']).to eq(@merchant.name)
    end

    it "returns a single merchant based on a name" do
      get "/api/v1/merchants/find?name=#{@merchant.name}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint['name']).to eq(@merchant.name)
    end

    it "returns a single merchant based on a created date" do
      get "/api/v1/merchants/find?created_at=#{@merchant.created_at}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint['name']).to eq(@merchant.name)
    end

    it "returns a single merchant based on updated date" do
      get "/api/v1/merchants/find?updated_at=#{@merchant.updated_at}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint['name']).to eq(@merchant.name)
    end
  end

  describe 'find_all endpoints' do
    before :each do
      @merchant1 = Merchant.create!(name: "Finn the Human",
                                    created_at: "2016-06-28 14:53:59 UTC",
                                    updated_at: "2017-06-28 14:53:59 UTC")
      @merchant2 = Merchant.create!(name: "Finn the Human",
                                    created_at: "2016-06-28 14:53:59 UTC",
                                    updated_at: "2014-06-28 14:53:59 UTC")
      @merchant3 = Merchant.create!(name: "Princess Bubblegum",
                                    created_at: "2013-06-28 14:53:59 UTC",
                                    updated_at: "2017-06-28 14:53:59 UTC")
    end

    it "returns a collection of merchants based on an id" do
      get "/api/v1/merchants/find_all?id=#{@merchant1.id}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint.first['name']).to eq(@merchant1.name)
    end

    it "returns a collection of merchants based on a name" do
      get "/api/v1/merchants/find_all?name=#{@merchant1.name}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint.count).to eq(2)
      expect(merchant_endpoint.first['name']).to eq(@merchant1.name)
    end

    it "returns a collection of merchants based on a created date" do
      get "/api/v1/merchants/find_all?created_at=#{@merchant1.created_at}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint.count).to eq(2)
      expect(merchant_endpoint.first['name']).to eq(@merchant1.name)
      expect(merchant_endpoint.last['name']).to eq(@merchant2.name)
    end

    it "returns a collection of merchants based on updated date" do
      get "/api/v1/merchants/find_all?updated_at=#{@merchant1.updated_at}"

      merchant_endpoint = JSON.parse(response.body)

      expect(merchant_endpoint.count).to eq(2)
      expect(merchant_endpoint.first['name']).to eq(@merchant1.name)
      expect(merchant_endpoint.last['name']).to eq(@merchant3.name)
    end
  end
