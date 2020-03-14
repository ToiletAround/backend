class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.references :toilet, null: false, foreign_key: true
      t.float :price
      t.timestamps
    end
  end
end
