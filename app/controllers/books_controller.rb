class BooksController < ApplicationController
  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully added.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @book = Book.find params[:id]
  end

  def index
    @books = Book.with_authors
  end

  def edit
    @book = Book.find params[:id]
    @authors = Author.all
  end

  def update
    @book = Book.find params[:id]
      respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.delete
        format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def borrow(book_id, user_id)
    service = LoanBook.new(book_id, user_id).call
  end

  def return(book, user)
    service = ReturnBook.new(book_id, user_id).call
  end

  private
  def book_params
    params.require(:book).permit(:title, :desc, :author_id)
  end
end
