class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /notes or /notes.json
  def index
    @notes = current_user.notes.order(cached_votes_score: :desc)
    if nil
    end
  end

  def upvote
      @note = current_user.notes.find(params[:id])
      if current_user.voted_up_on? @note
        @note.unvote_by current_user
      else
        @note.upvote_by current_user
      end
      render "vote.js.erb"
  end
  def downvote
      @note = current_user.notes.find(params[:id])
      if current_user.voted_down_on? @note
        @note.unvote_by current_user
      else
        @note.downvote_by current_user
      end
      render "vote.js.erb"
  end
  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = current_user.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = current_user.notes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:name, :description)
    end
end
