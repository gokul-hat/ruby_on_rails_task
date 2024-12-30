class Book
		def initialize(title, author, genre)
			@book_title = title
			@book_author = author
			@book_genre = genre
		end
	 
		def get_title
			@book_title
		end
	 
		def get_author
			@book_author
		end
	 
		def get_genre
			@book_genre
		end
	 
		def print_book
			puts "Book Title: #{@book_title}"
			puts "Book Author: #{@book_author}"
			puts "Book Genre: #{@book_genre}"
		end
	 end
	 
	 def search(books, title)
		is_found = false
		books.each do |bk|
			if bk.get_title.include?(title)
				is_found = true
				bk.print_book
			end
		end
		puts "Books not found" unless is_found
	 end
	 
	 def display_book_genre(books, genre)
		books.each do |bk|
			if bk.get_genre.include?(genre)
				bk.print_book
			end
		end
	 end
	 
	 def count_books_by_author(books)
		authors = {}
		books.each do |bk|
			author = bk.get_author
			authors[author] = authors.fetch(author, 0) + 1
		end
		puts "Books by authors:"
		authors.each { |author, count| puts "#{author}: #{count}" }
	 end
	 
	 def sort_by_title(books)
		titles = books.map(&:get_title).sort
		puts "Books sorted by title:"
		titles.each { |title| puts title }
	 end
	 
	 def add_book(books)
		print "Enter book title: "
		title = gets.chomp
		print "Enter book author: "
		author = gets.chomp
		print "Enter book genre: "
		genre = gets.chomp
		new_book = Book.new(title, author, genre)
		books << new_book
		puts "Book added successfully!"
	 end
	 
	 def main
		book1 = Book.new("Testing", "Gokul", "Sci-Fi")
		book2 = Book.new("Testing", "HP", "Sci-Fi")
		book3 = Book.new("Testing", "HK", "Science")
		book4 = Book.new("Demo", "Gokul", "Sci-Fi")
		book5 = Book.new("Guest", "Gokul", "Sci-Fi")
		
		book_list = [book1, book2, book3, book4, book5]
		
		loop do
			puts "\n library"
			puts "1. Add a Book"
			puts "2. Search by Title"
			puts "3. Display Books by Genre"
			puts "4. Count Books by Author"
			puts "5. Sort Books by Title"
			puts "6. Exit"
			print "Enter your choice: "
			choice = gets.chomp.to_i
			
			case choice
			when 1
				add_book(book_list)
			when 2
				print "Enter title to search: "
				title = gets.chomp
				search(book_list, title)
			when 3
				print "Enter genre to display: "
				genre = gets.chomp
				display_book_genre(book_list, genre)
			when 4
				count_books_by_author(book_list)
			when 5
				sort_by_title(book_list)
			when 6
				puts "Exit
				"
				break
			else
				puts "Invalid choice. Please try again."
			end
		end
	 end
	 
	 main