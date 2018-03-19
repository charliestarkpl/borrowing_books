class LoansController < ApplicationController
  def show
    @book = Book.find params[:book_id]
    @loans = Loan.book_history(params[:book_id])
  end
end
