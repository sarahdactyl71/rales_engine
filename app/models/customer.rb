class Customer < ApplicationRecord
  has_many :invoices

  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    self.invoices
    .joins(:merchant, :transactions)
    .where(transactions: {result: 0})
    .group(:merchant_id)
    .order
  end
end
