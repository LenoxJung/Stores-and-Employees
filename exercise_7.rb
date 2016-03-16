require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

def spewerrors(str, model)
  if !model.persisted?
    puts ""
    puts str
    # puts model.name
    model.errors.messages.each do |column, messages|
      # puts column
      messages.each do |message|
        puts "#{column} #{message}"
      end
    end
  end
end

puts "Exercise 7"
puts "----------"

# Your code goes here ...
puts 'Gimme a store name'
store_name = STDIN.gets.chomp
store = Store.create(name: store_name)
store.save
spewerrors(store_name, store)

surrey = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: true, womens_apparel: false)
surrey.save


puts 'gimme a first name'
employee_first_name = STDIN.gets.chomp
employee = surrey.employees.create(first_name: employee_first_name, hourly_rate: 220)
employee.save
spewerrors(employee_first_name, employee)

mystore2 = Store.create(name: "Mystore2", annual_revenue: 224000, mens_apparel: false, womens_apparel: false)
mystore2.save
spewerrors("Mystore2", mystore2)

spewerrors("Surrey" ,surrey)