require_relative 'utility'

module ListItems
  include Utility
  def list_all_rentals(rentals)
    if rentals.length.zero?
      puts "There is no rentals \n\n"
      return display_options
    end

    print('ID of person: ')
    id = gets.chomp.to_i
    puts('Rentals')
    puts('')

    puts('There is no rentals for this person') if (rentals.find { |rental| rental.person.id == id }).nil?
    rentals.each do |rental|
      puts("Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}") if rental.person.id == id
    end

    puts('')
    display_options
  end

  def list_all_books(books)
    puts('The Library is empty ,There is no books added yet!') if books.length.zero?

    books.each do |i|
      puts("Title: \"#{i.title}\", Author: #{i.author}")
    end

    puts('')
    display_options
  end

  def list_all_people(people)
    puts('There is person in the list!') if people.length.zero?

    people.each do |i|
      puts("[#{i.class.name}]: Name: #{i.name}, ID: #{i.id}, Age: #{i.age}")
    end

    puts('')
    display_options
  end
end
