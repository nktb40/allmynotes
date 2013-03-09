class Note < ActiveRecord::Base
  belongs_to :user
  has_many :group_note_rels
  attr_accessible :description, :link, :title, :user_id, :text
end
