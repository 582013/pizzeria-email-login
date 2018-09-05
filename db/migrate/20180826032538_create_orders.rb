class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :total
      t.boolean :payment
      t.string :email

      t.timestamps
    end
  end
end
