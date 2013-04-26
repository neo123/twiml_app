class CreateCustomerServices < ActiveRecord::Migration
  def change
    create_table :customer_services do |t|
      t.integer :position
      t.integer :customer_id
      t.integer :quantity
      t.integer :service_id

      t.timestamps
    end
  end
end
