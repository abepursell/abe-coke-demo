class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :sender_name
      t.string :cell_number
      t.string :recipient_name
      t.string :code
      t.string :drink_type

      t.timestamps
    end
  end
end
