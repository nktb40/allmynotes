class Api::V1::NotesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def index
    @notes = current_user.notes.all(:order => 'created_at DESC')
    render :text => @notes.to_json
  end  
  
  def show
    @note = Note.find(params[:id])
    render :text => @note.to_json
  end
end