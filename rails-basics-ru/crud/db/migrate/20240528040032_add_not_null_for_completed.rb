class AddNotNullForCompleted < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :completed, false
    change_column_default :tasks, :completed, false
  end
end
