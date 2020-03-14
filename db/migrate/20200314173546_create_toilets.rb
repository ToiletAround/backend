class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :name

      t.timestamps
    end
  end
end
