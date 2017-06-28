class Customer < ApplicationRecord
  has_many :invoices

  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    binding.pry
  end
end
