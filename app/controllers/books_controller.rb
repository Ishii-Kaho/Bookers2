class BooksController < ApplicationController

  def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
    redirect_to book_path(@post_book)
    else
      @post_books = PostBook.all
      render 'index'
    end
  end

  def show
    # ユーザーIDが〇〇（数字）の投稿を映す
    @post_books = PostBook.find(params[:id])
    @user = @post_books.user
    # そのユーザ（@user）に関連付けられた投稿（.post_books）のみ、@post_booksに渡すことができる↓
    # @post_books = @user.post_books.page(params[:page]).reverse_order
  end
  
  def edit
    @post_book = PostBook.find(params[:id])
  end
  
  def update
    @post_book = PostBook.find(params[:id])
    @post_book.update(post_book_params)
    redirect_to book_path(@post_book.id)
  end

  def index
    @post_books = PostBook.all
    @post_book = PostBook.new
    @user = User.find(current_user.id)
  end

  def destroy
    @post_book = PostBook.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end

    private

  def post_book_params
    params.require(:post_book).permit(:title, :opinion)
  end

end
