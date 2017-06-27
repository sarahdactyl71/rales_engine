require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "transaction can be created" do
    transaction = build(:transaction, credit_card_number: "58472983275", result: 0)

    expect(transaction.credit_card_number).to eq("58472983275")
    expect(transaction.credit_card_expiration_date.class).to eq(Date)
    expect(transaction.result).to eq("success")
  end
end
