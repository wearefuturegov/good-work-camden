class RenameTaggingsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :new_tables, :service_tags
  end
end
