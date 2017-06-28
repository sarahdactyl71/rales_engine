FactoryGirl.define do
  factory :merchant do
    name Faker::Name.name

    factory :merchant_with_invoices_and_items do
      # lauren's factories:
      invoices {create_list(:invoice_with_items, 3)}
    end
    factory :merchant_with_transactions do
      invoices {create_list(:invoice_with_transactions, 3)}
    end
  end
end
