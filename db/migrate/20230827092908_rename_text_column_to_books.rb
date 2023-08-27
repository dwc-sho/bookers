class RenameTextColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :text, :body
  end
end
