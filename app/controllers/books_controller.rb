class BooksController < ApplicationController
  def new
  end

  def crete
  end

  def show
    @user = User.find(params[:id])
    @users = @user.post_books.page(params[:page]).reverse_order
  end

  def show
  end

  def destroy
  end
end
