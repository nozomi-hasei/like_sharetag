class CreateMemoTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :memo_tag_relations do |t|
      t.references :tag, foreign_key: true
      t.references :memo, foreign_key: true
      t.timestamps
    end
  end
end
