class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.datetime :time

      t.timestamps
    end
  end
end
