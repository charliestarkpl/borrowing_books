25.times do |n|
  params = {
    name: "Uniq User-#{n}",
    email: "my_email-#{n}@example.com"
  }

  User.where(params).first_or_create!
end
