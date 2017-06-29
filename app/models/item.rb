class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 0})
    .group("items.id")
    .order("total DESC")
    .limit(quantity)
  end

  def self.most_items(quantity)
    select("items.*, sum(invoice_items.quantity) AS total")
    .joins(:invoice_items)
    .joins(invoices: [:transactions])
    .where(transactions: {result: 0})
    .group("items.id")
    .order("total DESC")
    .limit(quantity)
  end

  def best_day
    self.invoices.select("invoices.*, sum(invoice_items.quantity) AS quantity_sold")
    .joins(:invoice_items, :transactions)
    .where(transactions: {result: 0})
    .group(:id)
    .order("quantity_sold DESC, created_at DESC")
    .first
    .created_at
  end
end
