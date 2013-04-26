class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :client_id
      t.string :name

      t.timestamps
    end
  end
end
