class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue_top(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 0})
    .group("merchants.id")
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_items_top(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS items_sold")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: { result: 0 })
    .group(:id)
    .order("items_sold DESC")
    .limit(quantity)
  end

  def self.total_revenue_on(date)
    Invoice.joins(:invoice_items, :transactions)
    .where(invoices: {created_at: date.to_datetime})
    .merge(Transaction.success)
    .sum("unit_price * quantity")
  end
end
