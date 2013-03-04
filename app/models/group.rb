class Group < ActiveRecord::Base
  has_many :notes
  belongs_to :user
  attr_accessible :color, :title, :user_id
end
