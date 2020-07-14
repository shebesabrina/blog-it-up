class AddTimestampsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :created_at, :datetime, null: false, default: DateTime.now
    add_column :articles, :updated_at, :datetime, null: false, default: DateTime.now
  end
end
