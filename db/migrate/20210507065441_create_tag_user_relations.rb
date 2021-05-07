class CreateTagUserRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_user_relations do |t|

      t.timestamps
    end
  end
end
