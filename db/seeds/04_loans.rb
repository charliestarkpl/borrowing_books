user_ids = User.all.pluck :id
book_ids = Book.all.pluck :id

15.times do |n|
  params = {
    user_id: user_ids.sample,
    book_id: book_ids.sample,
    checkout_date: Date.today - 10
  }
  Loan.where(params).first_or_create!
end
