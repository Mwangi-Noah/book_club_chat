# db/seeds.rb

# Clear previous data
puts 'Clearing previous data...'
Message.destroy_all
Reading.destroy_all
Membership.destroy_all
Book.destroy_all
BookClub.destroy_all
User.destroy_all

# Create BookClubs
book_clubs = BookClub.create([
  { name: 'Fantasy Book Club' },
  { name: 'Sci-Fi Book Club' },
  { name: 'Mystery Book Club' }
])

# Create Users
users = User.create([
  { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password', location: 'New York' },
  { first_name: 'Jane', last_name: 'Smith', email: 'jane.smith@example.com', password: 'password', location: 'Los Angeles' },
  { first_name: 'Michael', last_name: 'Johnson', email: 'michael.johnson@example.com', password: 'password', location: 'Chicago' }
])

# Create Memberships
memberships = Membership.create([
  { user: users[0], book_club: book_clubs[0] },
  { user: users[1], book_club: book_clubs[0] },
  { user: users[1], book_club: book_clubs[1] },
  { user: users[2], book_club: book_clubs[2] }
])

# Create Books
books = Book.create([
  { title: 'The Lord of the Rings' },
  { title: 'Dune' },
  { title: 'Gone Girl' }
])

# Create Readings
readings = Reading.create([
  { user: users[0], book: books[0], book_club: book_clubs[0] },
  { user: users[0], book: books[1], book_club: book_clubs[1] },
  { user: users[1], book: books[2], book_club: book_clubs[2] }
])

# Create Messages
messages = Message.create([
  { content: 'Excited to discuss The Lord of the Rings!', user: users[0], book_club: book_clubs[0] },
  { content: 'Any recommendations for sci-fi books?', user: users[1], book_club: book_clubs[1] },
  { content: 'Just finished Gone Girl. What a thriller!', user: users[2], book_club: book_clubs[2] }
])

puts 'Seeding completed!'