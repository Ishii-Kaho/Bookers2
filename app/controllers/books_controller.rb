class BooksController < ApplicationController
  def new
    @post_book = post_book.new
  end

  def crete
    @post_book = post_book.new(post_book.params)
    @post_book.user_id = current_user.id
    post_book.save
    redirect_to book_path
  end

  def show
    @post_book = PostBook.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
  end

  def destroy
    @post_book = PostBook.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end
  
    private

  def post_book_params
    params.require(:post_book).permit(:name, :opinion)
  end
  
end
