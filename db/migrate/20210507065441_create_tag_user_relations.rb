class CreateTagUserRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_user_relations do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
