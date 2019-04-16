class PhrasesController < ApplicationController
  before_action :category_param, only: [:edit, :create]

  def index
    @phrases = Phrase.all
  end

  def new
   @phrase = Phrase.new()
  end

  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
      flash[:notice] = 'Phrase has been created!'
      redirect_to phrases_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def category_param
    params[:phrase][:category] = params[:phrase][:category].to_i
  end

  def phrase_params
    params.require(:phrase).permit(:phrase, :translation, :category)
  end

end
