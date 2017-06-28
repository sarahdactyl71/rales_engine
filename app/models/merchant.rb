class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices


  has_many :customers, through: :invoices

  def self.most_revenue_top(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 0})
    .group("merchants.id")
    .order("revenue DESC")
    .limit(quantity)
  end

end
