class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.time :start
      t.time :end
      t.references :toilet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
