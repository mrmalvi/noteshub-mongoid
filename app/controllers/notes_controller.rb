class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path, notice: "Note created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to notes_path, notice: "Note updated!"
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice: "Note deleted!"
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    load_params = params.require(:note).permit(:title, :content, :tags)
    load_params[:tags] = load_params[:tags].split(',').map(&:strip) if load_params[:tags].is_a?(String)
    load_params
  end
end
