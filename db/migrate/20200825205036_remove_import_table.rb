class RemoveImportTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :import
  end
end
