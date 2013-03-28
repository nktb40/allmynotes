class Note < ActiveRecord::Base
  belongs_to :user
  has_many :group_note_rels, :dependent => :delete_all
  attr_accessible :description, :link, :title, :user_id, :text
end
