BooksLibraries.destroy_all
Book.destroy_all
Library.destroy_all
County.destroy_all
Person.destroy_all

20.times {
  p = Person.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    library_card: rand(100000000..999999999)
  )
}

boulder = County.create!(
  name: 'Boulder',
  population: 108250,
  coordinates: '40N 105W'
)
denver = County.create!(
  name: 'Denver',
  population: 715000,
  coordinates: '39N 104W'
)

Library.create!(
  county: denver,
  name: 'Central Library',
  address: '10 W. Fourteenth Ave. Pkwy. 80204',
  telephone: '720-865-1111'
)
Library.create!(
  county: denver,
  name: 'Athmar Park Branch Library',
  address: '1055 S. Tejon Street 80223',
  telephone: '720-865-0230'
)
Library.create!(
  county: denver,
  name: 'Ross-Barnum Branch Library',
  address: '3570 W. First Avenue 80219',
  telephone: '720-865-0145'
)
Library.create!(
  county: denver,
  name: 'Bear Valley Branch Library',
  address: '5171 W. Dartmouth Ave. 80236',
  telephone: '720-865-0975'
)
Library.create!(
  county: denver,
  name: 'Blair-Caldwell African American Research Library',
  address: '2401 Welton St. 80205',
  telephone: '720-865-2401'
)

#            111 11111
# 0123 567 9 123 56789
# ISBN 978-0-306-40615

Ones = [5, 7, 11, 13, 16, 18]
Threes = [6, 9, 12, 15, 17, 19]

def checksum(isbn)
  # https://en.wikipedia.org/wiki/ISBN
  ones = isbn.chars.each_with_index.map {|e, n| e if Ones.include?(n) }.compact
  threes = isbn.chars.each_with_index.map {|e, n| e if Threes.include?(n) }.compact
  cs = (10 - ((ones.map {|n| n.to_i}.sum + threes.map {|n| n.to_i*3}.sum) % 10))
  cs == 10 ? "0" : cs.to_s
end

# a couple of quick sanity checks
raise "Bad checksum" unless checksum("ISBN 978-0-306-40615") == "7"
raise "Bad checksum" unless checksum("ISBN 978-0-131-17705") == "5"

def rs(length)
  (1..length).map { rand(0..9) }.join + '-'
end

def random_isbn
  digits = rs(3) + rs(1) + rs(3) + rs(5)
  "ISBN " + digits + checksum(digits)
end

20.times {
    book = Book.create!(
      person: Person.find(rand(Person.first.id..Person.last.id)),
      title: Faker::Book.title,
      isbn: random_isbn
    )
    BooksLibraries.create!(
      book: book,
      library: Library.find(rand(Library.first.id..Library.last.id))
    )
}
