class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    # all the books that I own, where user-book relationship.owned = true
    rels = current_user.user_book_relationships
    @my_books = Book.where(id: rels.where(owned: true).select(:book_id))
    @my_books_count = @my_books.count
    @my_previously_owned_books = Book.where(id: rels.where(owned: false).select(:book_id))
    @my_previously_owned_books_count = @my_previously_owned_books.count
  end

  def home
  end

end
