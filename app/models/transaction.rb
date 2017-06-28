class Transaction < ApplicationRecord
  scope :success, -> { where(result: 0) }
  scope :failed, -> { where(result: 1) }

  belongs_to :invoice
  enum result: [:success, :failed]
end
