class AddTimestampsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :created_at, :datetime, null: false, default: DateTime.now
    add_column :comments, :updated_at, :datetime, null: false, default: DateTime.now
  end
end
