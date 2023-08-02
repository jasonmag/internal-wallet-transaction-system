class Wallet < ApplicationRecord
  belongs_to :model, polymorphic: true
  has_many :credit_transactions, class_name: 'Transaction', foreign_key: 'target_wallet_id'
  has_many :debit_transactions, class_name: 'Transaction', foreign_key: 'source_wallet_id'

  validates :model, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
