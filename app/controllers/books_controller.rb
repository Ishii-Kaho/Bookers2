class BooksController < ApplicationController
  
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
    # ユーザーIDが〇〇（数字）の投稿を映す
    @book = Book.find(params[:id])
    @booknew = Book.new
    @user = @book.user
    # そのユーザ（@user）に関連付けられた投稿（.books）のみ、@booksに渡すことができる↓
    # @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
    
  end

  def update
    @book = Book.find(params[:id])
    if
      @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
