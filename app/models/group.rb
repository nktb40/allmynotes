class Group < ActiveRecord::Base
  has_many :group_note_rels
  belongs_to :user
  attr_accessible :color, :title, :user_id
end
