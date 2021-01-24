class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.integer :event_id

      t.timestamps
    end
  end
end
