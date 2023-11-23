class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table 'customers', force: :cascade do |t|
      t.string :address_street
      t.string :address_city
      t.jsonb :balance, default: {}
      t.timestamps
    end
  end
end
