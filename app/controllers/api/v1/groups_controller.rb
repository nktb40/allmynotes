class Api::V1::GroupsController < ApplicationController
  #skip_before_filter :verify_authenticity_token,
   #                  :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  before_filter :authenticate_user!

  respond_to :json

  def index
    @groups = current_user.groups.all(:order => 'created_at DESC')
    render :text => @groups.to_json
  end  
  
  def show
    @notes = Note.joins(:group_note_rels).where(:group_note_rels=>{:group_id=>params[:id]}).order("created_at DESC")
    render :text => @notes.to_json
  end
end