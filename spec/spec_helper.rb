require 'pg'
require 'rspec'
require 'expense'
require 'category'
require 'category_expenses'

DB = PG.connect({:dbname => "expense_organizer"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
    DB.exec("DELETE FROM category_expenses *;")
  end
end

