require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_options
    puts('Welcome to school library App!')
    puts('Please choose an option by entering a a number:')
    puts('1 - List all books')
    puts('2 - List all people')
    puts('3 - Create a person')
    puts('4 - Create a book')
    puts('5 - Create a rental')
    puts('6 - List all rentals for a given person id')
    puts('7 - To clear the screen')
    puts('8 - Exit')
    puts('')
  end

  def run_cases(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    end
  end

  def run
    display_options
    @input = 0
    while (@input = gets.chomp) != '8'
      puts ''
      if @input == '7'
        system('clear')
        display_options
      end
      run_cases(@input)
    end
  end

  def list_all_books
    puts('The Library is empty ,There is no books added yet!') if @books.length.zero?

    @books.each do |i|
      puts("Title: \"#{i.title}\", Author: #{i.author}")
    end

    puts('')
    display_options
  end

  def list_all_people
    puts('There is person in the list!') if @people.length.zero?

    @people.each do |i|
      puts("[#{i.class.name}]: Name: #{i.name}, ID: #{i.id}, Age: #{i.age}")
    end

    puts('')
    display_options
  end

  def create_book()
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book
    puts('Book created successfully')

    puts('')

    display_options
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '

    parent_permission = ''

    case gets.chomp.downcase
    when 'y'
      parent_permission = true

    when 'n'
      parent_permission = false
    else
      puts('please enter [Y/N]: ')
    end

    new_student = Student.new(age, name, parent_permission)
    @people << new_student

    puts('Person created successfully!')
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    new_teacher = Teacher.new(age, name, specialization)
    @people << new_teacher
    puts('Person created successfully!')
  end

  def create_person
    puts('Do you want to create a student (1) or a teacher (2) ? [Input the number]:')
    category = gets.chomp
    case category
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts('Please enter [1/2]: ')
    end

    puts('')
    display_options
  end

  def list_all_rentals
    print('ID of person: ')
    id = gets.chomp.to_i
    puts('Rentals')
    puts('')

    puts 'There is no rentals' if @rentals.length.zero?

    @rentals.each do |i|
      puts("Date: #{i.date}, Book \"#{i.book.title}\" by #{i.book.author}") if i.person.id == id
    end

    puts('')
    display_options
  end

  def create_rental
    puts('Select a book from the following list by number')
    (0..@books.length - 1).each do |i|
      puts("#{i}) Title: \"#{@books[i].title}\", Author: #{@books[i].author}")
    end

    selected_book_index = gets.chomp.to_i
    selected_book = @books[selected_book_index]

    puts('Select a person from the following list by number')
    (0..@people.length - 1).each do |i|
      puts("#{i}) [#{@people[i].class.name}] Name: #{@people[i].name}, Id: #{@people[i].id}, Age: #{@people[i].age}")
    end

    selected_person_index = gets.chomp.to_i
    selected_person = @people[selected_person_index]

    print('Date: ')
    rental_date = gets.chomp

    new_rental = Rental.new(rental_date, selected_book, selected_person)
    @rentals << new_rental

    puts('Rental created successfully!')

    puts('')
    display_options
  end
end
