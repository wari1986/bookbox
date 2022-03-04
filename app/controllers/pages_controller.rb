class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    # all the books that I own, where user-book relationship.owned = true
    @my_books = []
    my_user_book_relationships_true = UserBookRelationship.where(user: current_user, owned: true)
    my_user_book_relationships_true.each do |my_user_book_relationship_true|
      my_book = Book.find(my_user_book_relationship_true.book_id)
      @my_books << my_book
    end

    # all the books that I have previously owned, where user_book_relationship.owned = false
    @my_previously_owned_books = []
    my_user_book_relationships_false = UserBookRelationship.where(user: current_user, owned: false)
    my_user_book_relationships_false.each do |my_user_book_relationship_false|
      my_book = Book.find(my_user_book_relationship_false.book_id)
      @my_previously_owned_books << my_book
    end

    # all the swap (offers) that I have received and are pending for validation by me
    # TO DO: add a "pending" for :accepted (so change accepted from boolean to string)
    @pending_swaps_received = Swap.where(user: current_user, accepted: false)

    # all the swaps that I have made and are pending for validation by the owner
    # TO DO: add a "pending" for :accepted (so change accepted from boolean to string)
    @pending_swaps_sent = Swap.where(swapper: current_user, accepted: false)

    # all the users that have owned the books I currently own
    @my_books_chains = []
    @my_books.each do |my_book|
      my_book_user_book_relationships_true = UserBookRelationship.where(book_id: my_book.id)
      my_book_chain = []
      my_book_user_book_relationships_true.each do |my_book_user_book_relationship_true|
        previous_owner = User.find(my_book_user_book_relationship_true.user_id)
        my_book_chain << previous_owner
      end
      @my_books_chains << my_book_chain
    end
  end

  def home
  end

end
