class ChangeDataTypeForNotesTitle < ActiveRecord::Migration
   def self.up
    change_table :notes do |t|
      t.change :title, :text
    end
  end
 
  def self.down
    change_table :notes do |t|
      t.change :title, :string
    end
  end
end
