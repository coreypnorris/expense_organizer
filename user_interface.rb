require 'pg'
require './lib/expense'
require './lib/category'
require './lib/category_expenses'

DB = PG.connect({ :dbname => 'expense_organizer' })

def welcome
  puts "\n\n"
  puts "Welcome to Expense Organizer"
  main_menu
end

def main_menu
  puts "\n"
  puts "==========="
  puts " MAIN MENU "
  puts "==========="

  puts "A - Add a new expense"
  puts "L - List all expenses"
  puts "D - Delete an expense"
  puts "F - Find an expense"
  puts "X - Exit the program"

  case gets.chomp.upcase
  when 'A'
    add_expense
  when 'L'
    list_expenses
  when 'D'
    delete_expense
  when 'F'
    find_expense
  when 'X'
    puts "Goodbye"
    exit
  else
    puts "Invalid input"
    main_menu
  end
end

def add_expense
  puts "\n\n"
  print "Enter the expense description: "
  description = gets.chomp
  print "Enter the amount: "
  print "$"
  amount = gets.chomp.to_f
  print "Enter the date (YYYY-MM-DD): "
  date = gets.chomp
  print "Enter the category: "
  category = gets.chomp
  new_expense = Expense.create({ :description => description, :amount => amount, :date => date })
  new_category = Category.create({ :name => category })
  Category_expenses.create({ :expense_id => new_expense.id, :category_id => new_category.id })
  puts "\n\n"
  puts "#{new_expense.description} has been added to #{new_category.name}!"
  main_menu
end

def list_expenses
  puts "\n\n"
  Expense.all.each_with_index do |expense, index|
    amount = "%.2f" % expense.amount
    puts " #{index+1}) #{expense.description} bought for $#{amount} on #{expense.date}"
  end
  main_menu
end

# def delete_expense
#   puts "\n\n"
#   Expense.all.each_with_index do |expense, index|
#     amount = "%.2f" % expense.amount
#     puts " #{index+1}) #{expense.description} bought for $#{amount} on #{expense.date}"
#   end
#   print "Enter the number of the expense you would like to delete: "
#   selection = gets.chomp.to_i

# end


welcome
