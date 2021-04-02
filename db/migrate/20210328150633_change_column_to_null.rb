class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :genre_id, true
  end
end
