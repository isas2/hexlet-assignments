class ChangeDataTypeForDescription < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :description, :text
  end
end
