25.times do |n|
  params = {
    full_name: "Famous-#{n} book author",
    bio: "Very interesting and uniq biography"
  }

  Author.where(params).first_or_create!
end
