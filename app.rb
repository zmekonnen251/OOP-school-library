require 'json'
require_relative 'create_items'
require_relative 'list_items'
require_relative 'utility'
require './data_modules/load_data'
require './data_modules/save_data'

class App
  include CreateItems
  include Utility
  include ListItems
  include LoadData
  include SaveData

  def initialize
    @books = load_book
    @people = load_people
    @rentals = load_rentals(@books, @people)
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
      run_case(@input)
    end
    save_all(@books, @people, @rentals)
    puts("\nThank you for using our app!\n\n")
  end

  def run_case(input)
    case input
    when '1'
      list_all_books(@books)
    when '2'
      list_all_people(@people)
    when '3'
      create_person(@people)
    when '4'
      create_book(@books)
    when '5'
      create_rental(@books, @people, @rentals)
    when '6'
      list_all_rentals(@rentals)
    end
  end
end
