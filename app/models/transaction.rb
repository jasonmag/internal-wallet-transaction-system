class Transaction < ApplicationRecord
  belongs_to :model, polymorphic: true
  belongs_to :source_wallet, class_name: 'Wallet', foreign_key: 'source_wallet_id', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', foreign_key: 'target_wallet_id', optional: true

  validates :transaction_type, :amount, presence: true
end
