FactoryGirl.define do
  factory :invoice do
    status "shipped"

    factory :invoice_with_merchant do
      merchants {create_list(:merchant, 3)}
    end
    
    factory :invoice_with_customer do
      customers {create_list(:customer, 3)}
    end
  end
end
