class LoanBook
  def initialize(book_id, user_id)
    @book_id = book_id
    @user_id = user_id
  end

  def call
    book_borrowed? ? can_not_loan : loan_a_book
  end

  private

  def book_borrowed?
    book.borrowed?
  end

  def can_not_loan
    { error: "Book is already borrowed" }
  end

  def book
    find_book ||= Book.find @book_id
  end

  def loan_a_book
    create_loan
    change_borrow_status
  end

  def create_loan
    Loan.create!(
      user_id: @user_id,
      book_id: @book_id,
      status: 0,
      checkout_date: Date.today
    )
  end

  def change_borrow_status
    book.toggle_borrow!
  end
end
