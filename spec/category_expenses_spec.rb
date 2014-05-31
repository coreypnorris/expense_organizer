require 'spec_helper'

describe 'Category_expenses' do
  describe '#initialize' do
    it 'initializes an instance of Category_expenses' do
      test_expense = Category_expenses.new({ :category_id => 1, :expense_id => 2 })
      test_expense.should be_an_instance_of Category_expenses
    end

    it 'initializes the instance' do
      test_expense = Category_expenses.new({ :category_id => 1, :expense_id => 2 })
      test_expense.category_id.should eq 1
    end
  end

  describe '.create' do
    it 'initializes and saves a new instance' do
      test_expense = Category_expenses.create({ :category_id => 1, :expense_id => 2 })
      Category_expenses.all.should eq [test_expense]
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Category_expenses.all.should eq []
    end
    it 'returns all objects in the category_expenses table' do
      test_category_expense1 = Category_expenses.create({:category_id => 1, :expense_id => 2 })
      test_category_expense2 = Category_expenses.create({:category_id => 3, :expense_id => 4 })
      Category_expenses.all.should eq [test_category_expense1, test_category_expense2]
    end
  end

  describe '#save' do
    it 'saves a new expense to the database' do
      test_expense = Category_expenses.create({ :category_id => 1, :expense_id => 2 })
      Category_expenses.all.should eq [test_expense]
    end
  end

  describe '#==' do
    it 'should be equal to another expense if the name, id, date, and id are equal' do
      test_category_expense1 = Category_expenses.new({:category_id => 1, :expense_id => 2, :id => 1 })
      test_category_expense2 = Category_expenses.new({:category_id => 1, :expense_id => 2, :id => 1 })
      test_category_expense1.should eq test_category_expense2
    end
  end
end
