class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.decimal :balance, precision: 10, scale: 2
      t.references :model, polymorphic: true, null: false

      t.timestamps
    end
  end
end
