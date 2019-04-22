# frozen_string_literal: true

class PhrasesController < ApplicationController
  before_action :set_phrase!, only: %i[edit update destroy show vote]
  before_action :category_param, only: %i[create update]
  before_action :check_user!, only: %i[edit update destroy]
  before_action :check_user_before_example_deletion!, only: :delete_example

  def index
    @phrases = Phrase.includes(:user).paginate(page: params[:page])
  end

  def new
    @phrase = Phrase.new
    @phrase.examples.build(user_id: current_user.id)
  end

  def show
    @examples = @phrase.examples.includes(:user).paginate(page: params[:page])
    @example = @phrase.examples.build(user_id: current_user.id)
  end

  def edit
    @phrases = Phrase.includes(:user).paginate(page: params[:page])
  end

  def update
    if @phrase.update_attributes(phrase_params)
      flash[:notice] = 'Phrase has been updated!'
      redirect_to user_path(@phrase.user)
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create
    @phrase = current_user.phrases.new(phrase_params)
    if @phrase.save
      flash[:notice] = 'Phrase has been created!'
      redirect_to root_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end

  def create_example
    @example = @phrase.examples.new(example_params)
    if @example.save
      flash[:notice] = 'Example has been created!'
    else
      flash[:danger] = @example.errors.full_messages.to_sentence
    end
    redirect_to phrase_path
  end

  def destroy
    @phrase.destroy
    flash[:notice] = 'Phrase has been deleted!'
    redirect_to root_path
  end

  def vote
    shared_vote(@phrase)
    redirect_back(fallback_location: root_path)
  end

  private

  def category_param
    params[:phrase][:category] = params[:phrase][:category].to_i
  end

  def phrase_params
    params.require(:phrase).permit(:phrase, :translation, :category, examples_attributes: %i[example user_id _destroy])
  end

  def set_phrase!
    @phrase = Phrase.friendly.find(params[:id])
  end

  def check_user!
    unless @phrase.is_author? current_user
      flash[:danger] = 'You are not a phrase author'
      redirect_back(fallback_location: root_path)
    end
  end
end
