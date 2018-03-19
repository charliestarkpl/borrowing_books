user_ids = User.all.pluck :id
book_ids = Book.all.pluck :id

15.times do |n|
  params = {
    user_id: user_ids.sample,
    book_id: book_ids.sample
  }
  LoanBook.new(book_ids.sample, user_ids.sample).call
end
