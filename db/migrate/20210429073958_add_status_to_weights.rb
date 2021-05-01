class AddStatusToWeights < ActiveRecord::Migration[6.0]
  def change
    add_column :weights, :status, :integer, default: 1, null: false, limit: 1
  end
end
