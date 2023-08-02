class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.decimal :amount, precision: 10, scale: 2
      t.integer :source_wallet_id
      t.integer :target_wallet_id
      t.references :model, polymorphic: true, null: false

      t.timestamps
    end
  end
end
