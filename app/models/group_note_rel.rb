class GroupNoteRel < ActiveRecord::Base
  belongs_to :group
  belongs_to :note
  attr_accessible :group_id, :note_id
end
