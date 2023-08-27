class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # 追加分
      t.string :title
      t.string :text
      
      t.timestamps
    end
  end
end
