require_relative '../book'
require_relative '../student'
require_relative '../rental'

module LoadData
  def load_book
    if File.exist?('./data/books.json')
      saved_books = JSON.parse(File.read('./data/books.json'))
      books = []
      saved_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
      books
    else
      File.write('./data/books.json', '[]')
    end
  end

  def load_people
    if File.exist?('./data/persons.json')
      saved_people = JSON.parse(File.read('./data/persons.json'))
      people = []
      saved_people.each do |person|
        people << case person['person_class']
                  when 'Student'
                    Student.new(person['id'], person['age'], person['name'], person['parent_permission'])
                  when 'Teacher'
                    Teacher.new(person['id'], person['age'], person['name'], person['specialization'])
                  end
      end
      people
    else
      File.write('./data/persons.json', '[]')
    end
  end

  def load_rentals(books, people)
    if File.exist?('./data/rentals.json')
      saved_rentals = JSON.parse(File.read('./data/rentals.json'))
      rentals = []
      saved_rentals.each do |rental|
        rentals << Rental.new(rental['date'], books.find do |book|
                                                book.title == rental['book_title']
                                              end, people.find do |person|
                                                     person.id == rental['person_id']
                                                   end)
      end
      rentals

    else
      File.write('./data/rentals.json', '[]')
    end
  end
end
