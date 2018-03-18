class ReturnBook
  def initialize(book_id, user_id)
    @book_id = book_id
    @user_id = user_id
  end

  def call
    user_borrowed_book? ? return_book : can_not_return
  end

  private

  def user_borrowed_book?
    loan.nil? ? false : true
  end

  def loan
    user_loan ||= Loan.book_by_user(book, user)&.take
  end

  def book
    find_book ||= Book.find @book_id
  end

  def user
    find_user ||= User.find @user_id
  end

  def can_not_return
    { error: "User didn't borrow this book" }
  end

  def return_book
    return_loan
    change_borrow_status
  end

  def return_loan
    loan.close_loan!
  end

  def change_borrow_status
    book.toggle_borrow!
  end
end
