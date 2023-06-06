class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :destination_name
      t.string :delivery_postal_code
      t.string :shipping_address
      t.integer :method_of_payment
      t.integer :postage
      t.integer :total_amount

      t.timestamps
    end
  end
end
