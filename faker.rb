def prepare
  title = Faker::Book.title
  author = Faker::Book.author
  pages = Faker::Number.between(100,1000)
  year = Faker::Number.between(1918,2018)
  {name: title, author: author, pages: pages, year: year}
end
3.times do 
  Book.create(prepare)
end