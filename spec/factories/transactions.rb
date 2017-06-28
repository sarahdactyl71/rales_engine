FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyText"
    credit_card_expiration_date "2017-06-26"
    result 0

    invoice
  end
end
