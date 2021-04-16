class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.decimal :weight_body, null: false, precision: 6, scale: 2
      t.references :user,                foreign_key: true
      
      t.timestamps
    end
  end
end
