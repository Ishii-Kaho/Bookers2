class BooksController < ApplicationController

  def crete
    @post_book = post_book.new(post_book.params)
    @post_book.user_id = current_user.id
    post_book.save
    redirect_to book_path
  end

  def show
    @user = User.find(params[:id])
    @post_book = PostBook.find(params[:id])
    # そのユーザ（@user）に関連付けられた投稿（.post_books）のみ、@post_booksに渡すことができる↓
    # @post_books = @user.post_books.page(params[:page]).reverse_order
  end

  def index
    @post_books = PostBook.all
    @post_book = PostBook.new
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
