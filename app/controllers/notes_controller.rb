class NotesController < ApplicationController
  before_filter :authenticate_user! 
  def index
    @notes = current_user.notes.all(:order => 'created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end
  
  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
  end
  
  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new 
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
    @groups = current_user.groups
  end

  # POST /notes
  # POST /notes.json
  def create
    @user = current_user
    @note = @user.notes.new(params[:note])
    params = parse_html(@note)
	 if @note.title == ""
	    @note.title = params[0]
	 end
	 if @note.description.to_s == ''
	 	 @note.description = params[1]
	 end
    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to (:back) }
      format.json { head :no_content }
    end
  end
  def multiple_action
  	if params[:new_btn]
    @note = Note.new
    redirect_to :action=>"new"
   end
   if params[:destroy_btn]
   	if params[:note_ids]
	    Note.destroy(params[:note_ids])
	   end
	    redirect_to (:back)
   end
   if params[:add_rel_btn]
	    if params[:note_ids] && params[:group_ids]
		    params[:note_ids].each do |note|
		    	params[:group_ids].each do |group|
		    		if !GroupNoteRel.exists?(:group_id=>[group], :note_id=>[note])
			    		@rel = GroupNoteRel.new
			    		@rel.group_id = group
			    		@rel.note_id = note
			    		@rel.save
			    	end
		    	end
		    end
	    end
	    redirect_to (:back)
   end
  end 
end
