class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    rels = @user.user_book_relationships
    @user_books = Book.where(id: rels.where(owned: true).select(:book_id))
  end
end
