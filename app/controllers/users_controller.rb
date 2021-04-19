class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.post_books.page(params[:page]).reverse_order
  end
  
end
