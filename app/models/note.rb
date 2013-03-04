class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  attr_accessible :description, :link, :title, :user_id, :group_id, :text
end
