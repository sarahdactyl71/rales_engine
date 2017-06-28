require "rails_helper"

describe 'find endpoints' do
  before :each do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant: merchant, customer: customer)
    @transaction = create(:transaction, credit_card_number: '6789', result: 'failed', created_at: "2016-06-28 14:53:59 UTC",
    updated_at: "2017-06-28 14:53:59 UTC", invoice: invoice)
  end

  it "returns a single transaction based on an id" do
    get "/api/v1/transactions/find?id=#{@transaction.id}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint['id']).to eq(@transaction.id)
  end

  it "returns a single transaction based on a credit_card_number" do
    get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint['id']).to eq(@transaction.id)
  end

  it "returns a single transaction based on a result" do
    get "/api/v1/transactions/find?result=#{@transaction.result}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint['id']).to eq(@transaction.id)
  end

  it "returns a single transaction based on a created date" do
    get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint['id']).to eq(@transaction.id)
  end

  it "returns a single transaction based on updated date" do
    get "/api/v1/transactions/find?updated_at=#{@transaction.updated_at}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint['id']).to eq(@transaction.id)
  end
end

describe 'find_all endpoints' do
  before :each do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant: merchant, customer: customer)
    @transaction1 = Transaction.create!(credit_card_number: "12345",
                                        result: "success",
                                        created_at: "2000-06-28 14:53:59 UTC",
                                        updated_at: "2001-06-28 14:53:59 UTC",
                                        invoice: invoice)
    @transaction2 = Transaction.create!(credit_card_number: "12345",
                                        result: "success",
                                        created_at: "2003-06-28 14:53:59 UTC",
                                        updated_at: "2005-06-28 14:53:59 UTC",
                                        invoice: invoice)
    @transaction3 = Transaction.create!(credit_card_number: "6789",
                                        result: "failed",
                                        created_at: "2004-06-28 14:53:59 UTC",
                                        updated_at: "2005-06-28 14:53:59 UTC",
                                        invoice: invoice)
    @transaction4 = Transaction.create!(credit_card_number: "6789",
                                        result: "failed",
                                        created_at: "2000-06-28 14:53:59 UTC",
                                        updated_at: "2032-06-28 14:53:59 UTC",
                                        invoice: invoice)
  end
  it "returns a collection of transactions based on an id" do
    get "/api/v1/transactions/find_all?id=#{@transaction1.id}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint.first['id']).to eq(@transaction1.id)
  end

  it "returns a collection of transactions based on a cc#{}" do
    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction1.credit_card_number}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint.count).to eq(2)
    expect(transaction_endpoint.first['id']).to eq(@transaction1.id)
  end

  it "returns a collection of transactions based on a created date" do
    get "/api/v1/transactions/find_all?created_at=#{@transaction1.created_at}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint.count).to eq(2)
    expect(transaction_endpoint.first['id']).to eq(@transaction1.id)
    expect(transaction_endpoint.last['id']).to eq(@transaction4.id)
  end

  it "returns a collection of transactions based on updated date" do
    get "/api/v1/transactions/find_all?updated_at=#{@transaction2.updated_at}"

    transaction_endpoint = JSON.parse(response.body)

    expect(transaction_endpoint.count).to eq(2)
    expect(transaction_endpoint.first['id']).to eq(@transaction2.id)
    expect(transaction_endpoint.last['id']).to eq(@transaction3.id)
  end
end
