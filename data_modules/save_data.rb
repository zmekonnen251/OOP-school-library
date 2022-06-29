module SaveData
  def save_all(books, people, rentals)
    save_books(books)
    save_people(people)
    save_rentals(rentals)
  end

  def save_books(books)
    books_to_save = []
    books.each do |book|
      books_to_save << { 'title' => book.title, 'author' => book.author }
    end
    File.write('./data/books.json', JSON.generate(books_to_save))
  end

  def save_people(people)
    people_to_save = []
    people.each do |person|
      people_to_save << { 'name' => person.name,
                          'age' => person.age, 'id' => person.id,
                          'parent_permission' => person.parent_permission,
                          'person_class' => person.class.name }
    end
    File.write('./data/persons.json', JSON.generate(people_to_save))
  end

  def save_rentals(rentals)
    rentals_to_save = []
    rentals.each do |rental|
      rentals_to_save << { 'date' => rental.date,
                           'person_name' => rental.person.name,
                           'book_title' => rental.book.title, 'person_id' => rental.person.id }
    end
    File.write('./data/rentals.json', JSON.generate(rentals_to_save))
  end
end
