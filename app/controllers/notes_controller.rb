class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.notes.ransack(params[:q])
    @notes = @q.result(distinct: true).page(params[:page])
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to notes_url, notice: "タスク「#{@note.name}」を登録しました。"
    else
      render :new
    end
  end


  def edit
  end

  def update
    @note.update!(note_params)
    redirect_to notes_url, notice: "「#{@note.name}」を更新しました。"
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: "「#{@note.name}」を完了しました。"
  end

  private

    def note_params
      params.require(:note).permit(:name, :created_at, :description)
    end

    def set_note
      @note = current_user.notes.find(params[:id])
    end
end
