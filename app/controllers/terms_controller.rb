class TermsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_term, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.terms.ransack(params[:q])
    @terms = @q.result(distinct: true).page(params[:page])
  end

  def show
  end

  def new
    @term = Term.new
  end

  def create
    @term = current_user.terms.new(term_params)
    if @term.save
      redirect_to terms_url, notice: "用語「#{@term.name}」を登録しました。"
    else
      render :new
    end
  end


  def edit
  end

  def update
    @term.update!(term_params)
    redirect_to terms_url, notice: "「#{@term.name}」を更新しました。"
  end

  def destroy
    @term.destroy
    redirect_to terms_url, notice: "「#{@term.name}」を削除しました。"
  end

  private

    def term_params
      params.require(:term).permit(:name, :field, :description)
    end

    def set_term
      @term = current_user.terms.find(params[:id])
    end
end
