require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'utility'
require_relative 'book'

module CreateItems
  include Utility
  def create_student(people)
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
    people << new_student

    puts('Person created successfully!')
  end

  def create_teacher(_people)
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

  def create_person(people)
    puts('Do you want to create a student (1) or a teacher (2) ? [Input the number]:')
    category = gets.chomp
    case category
    when '1'
      create_student(people)
    when '2'
      create_teacher(people)
    else
      puts('Please enter [1/2]: ')
    end

    puts('')
    display_options
  end

  def create_book(books)
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp

    new_book = Book.new(title, author)
    books << new_book
    puts('Book created successfully')

    puts('')

    display_options
  end

  def create_rental(books, people, rentals)
    puts('Select a book from the following list by number')
    (0..@books.length - 1).each do |i|
      puts("#{i}) Title: \"#{books[i].title}\", Author: #{books[i].author}")
    end

    selected_book_index = gets.chomp.to_i
    selected_book = books[selected_book_index]

    puts('Select a person from the following list by number')
    (0..people.length - 1).each do |i|
      puts("#{i}) [#{people[i].class.name}] Name: #{people[i].name}, Id: #{people[i].id}, Age: #{people[i].age}")
    end

    selected_person_index = gets.chomp.to_i
    selected_person = people[selected_person_index]

    print('Date (yyyy/mm/dd): ')
    rental_date = gets.chomp

    new_rental = Rental.new(rental_date, selected_book, selected_person)
    rentals << new_rental

    puts('Rental created successfully!')

    puts('')
    display_options
  end
end
