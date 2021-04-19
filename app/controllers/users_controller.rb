class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.post_books.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @user = User.all
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :opinion, :profile_image)  end
end
