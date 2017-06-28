FactoryGirl.define do
  factory :invoice do
    status "shipped"

    merchant
    customer

    factory :invoice_with_items do
      invoice_items { create_list(:invoice_item, 3)}
      transactions { create_list(:transaction, 3)}
    end

    factory :invoice_with_transactions do
      transactions {create_list(:transaction, 3)}
    end
  end
end
