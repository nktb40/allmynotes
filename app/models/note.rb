class Note < ActiveRecord::Base
  belongs_to :user
  has_many :group_note_rels, :dependent => :delete_all
  attr_accessible :description, :link, :title, :user_id, :text
  
  include PgSearch 
  pg_search_scope :notes_search, 
  	:against => { 
  		:title => 'A', 
  		:link => 'B',
  		:description => 'C',
  		:text => 'D' 
  	}, 
  	:using => { 
  		:tsearch => {:prefix => true} 
    } 
end
