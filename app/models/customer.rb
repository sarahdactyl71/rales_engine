class Customer < ApplicationRecord
  has_many :invoices

  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    fave_merch =
    self.merchants
    .joins(invoices: [:transactions])
    .where(transactions: {result: 0})
    .group(:id)
    .order("count_all DESC")
    .count
    .first
    Merchant.find(fave_merch[0])
  end
end
