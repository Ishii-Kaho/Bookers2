class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    # 選択したユーザーの全ての投稿を表示させる
    @books = @user.books
    # @users = @user.books.page(params[:page]).reverse_order
  end

  def edit
    # 夜に編集元↓
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user.id == @user.id
    # p current_user.id
    # p params[:id].to_i
    # if  current_user.id == params[:id].to_i
    #   @user = User.find(params[:id])
    # else
    #   redirect_to user_path(current_user.id)
    # end
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render action: :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
