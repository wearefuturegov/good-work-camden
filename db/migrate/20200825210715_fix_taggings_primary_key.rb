class FixTaggingsPrimaryKey < ActiveRecord::Migration[6.0]
  def change
    drop_table :service_tags

    create_table :new_tables do |t|
      t.references :service, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.boolean :required
      t.boolean :excluded
    end

  end
end
