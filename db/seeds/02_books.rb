authors_ids = Author.pluck :id

25.times do |n|
  params = {
    title: "An interesting book-#{n}",
    desc: "Very interesting and uniq book",
    borrowed: false,
    author_id: authors_ids.sample
  }

  Book.where(params).first_or_create!
end
