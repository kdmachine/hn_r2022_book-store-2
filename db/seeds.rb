10.times do
  name = Faker::Book.unique.publisher
  address = Faker::Address.full_address
  phone = Faker::PhoneNumber.phone_number
  website = "https://www.google.com"
  description = Faker::Lorem.sentence(word_count: 15)
  Publisher.create!(name: name,
                    phone: phone,
                    website: website,
                    desc: description
  )
end

10.times do
  name = Faker::Book.unique.genre
  description = Faker::Lorem.sentence(word_count: 15)
  Category.create!(name: name,
                   desc: description
  )
end

30.times do
  name = Faker::FunnyName.name
  description = Faker::Lorem.sentence(word_count: 50)
  num_pages = Faker::Number.between(from: 50, to: 1000)
  price = Faker::Number.between(from: 1, to: 100)
  quantity = Faker::Number.between(from: 0, to: 200)
  Book.create!(name: name,
              desc: description,
              nopage: num_pages,
              quantity: quantity,
              price: price,
              publisher_id: Publisher.all.pluck(:id).sample,
              category_id: Category.all.pluck(:id).sample
  )
end

User.create!(name: "Peter",
  email: "admin@bookstore.com",
  password: "123456",
  address: "Thanh Xuan, Hanoi",
  phone: Faker::PhoneNumber.phone_number,
  role: 1,
  activated: true,
  activated_at: Time.zone.now)

10.times do |n|
  name = "User #{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  address = Faker::Address.full_address
  User.create!(name: name,
               email: email,
               password: password,
               address: address,
               phone: Faker::PhoneNumber.phone_number,
               activated: true,
               activated_at: Time.zone.now
  )
end

20.times do |n|
  name = "Author #{n+1}"
  Author.create!(name: name,
                 desc: Faker::Lorem.sentence(word_count: 30)
  )
end

50.times do
  BookAuthor.create!(author_id: Author.all.pluck(:id).sample,
                     book_id: Book.all.pluck(:id).sample
  )
end
