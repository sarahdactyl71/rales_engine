class Transaction < ApplicationRecord
  scope :success, -> { where(result: 0) }
  scope :failed, -> { where(result: 1) }

  belongs_to :invoice
  enum result: [:success, :failed]

  def self.most_revenue_top(limit)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 0})
    .group("merchants.id")
    .order("revenue DESC")
    .limit(limit)
  end
end
