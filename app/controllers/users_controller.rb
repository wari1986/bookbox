class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @owned_user_books = show_owned_books
    @previously_owned_user_books = show_previously_owned_user_books
  end

  private

  def show_owned_books
    @user = User.find(params[:id])
    rels = @user.user_book_relationships
    Book.where(id: rels.where(owned: true).select(:book_id))

  end

  def show_previously_owned_user_books
    @user = User.find(params[:id])
    rels = @user.user_book_relationships
    Book.where(id: rels.where(owned: false).select(:book_id))
  end

end
