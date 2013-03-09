class CreateGroupNoteRels < ActiveRecord::Migration
  def change
    create_table :group_note_rels do |t|
      t.integer :group_id
      t.integer :note_id
      
      t.timestamps
      remove_column :notes, :group_id
    end
  end
end
