class HomesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_books = @user.post_images.page(params[:page]).reverse_order
  end
end
