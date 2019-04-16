class UserController < ApplicationController

def show
  @user = User.where(id: params[:id]).first
  @phrases = @user.phrases
end

def index
  @user = User.paginate(:page => params[:page])
end

end
