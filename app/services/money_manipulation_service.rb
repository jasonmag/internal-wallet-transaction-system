class MoneyManipulationService
  def self.credit(wallet, amount)
    return false if amount <= 0

    wallet.update(balance: wallet.balance + amount)
    create_transaction(wallet, 'credit', amount)
  end

  def self.debit(wallet, amount)
    return false if amount <= 0 || wallet.balance < amount

    wallet.update(balance: wallet.balance - amount)
    create_transaction(wallet, 'debit', amount)
  end

  private

  def self.create_transaction(wallet, transaction_type, amount)
    Transaction.create(model: wallet.model, source_wallet: transaction_type == 'debit' ? wallet : nil, target_wallet: transaction_type == 'credit' ? wallet : nil, transaction_type: transaction_type, amount: amount)
  end
end
