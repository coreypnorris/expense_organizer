require 'spec_helper'

describe 'Category' do
  describe '#initialize' do
    it 'initializes an instance of Category' do
      test_expense = Category.new({ :name => 'Burger'})
      test_expense.should be_an_instance_of Category
    end

    it 'initializes the instance with a name, id, and date' do
      test_expense = Category.new({ :name => 'Burger'})
      test_expense.name.should eq 'Burger'
    end
  end

  describe '.create' do
    it 'initializes and saves a new instance' do
      test_expense = Category.create({ :name => 'Burger'})
      Category.all.should eq [test_expense]
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Category.all.should eq []
    end
    it 'should return all saved instances' do
      test_expense = Category.create({ :name => 'Burger'})
      Category.all.should eq [test_expense]
    end
  end

  describe '#save' do
    it 'saves a new expense to the database' do
      test_expense = Category.create({ :name => 'Burger'})
      Category.all.should eq [test_expense]
    end
  end

  describe '#==' do
    it 'should be equal to another expense if the name, id, date, and id are equal' do
      test_expense1 = Category.new({ :name => 'Burger', :id => 1 })
      test_expense2 = Category.new({ :name => 'Burger', :id => 1 })
      test_expense1.should eq test_expense2
    end
  end

  describe '.search_by_name' do
    it 'should find the expense object based of the users input' do
      test_expense1 = Category.create({ :name => 'Burger'})
      test_expense2 = Category.create({ :name => 'Steak'})
      Category.search_by_name('Steak').should eq [test_expense2]
    end
  end

  describe '#percent_of_total' do
    it 'should return the percent of the total amount as attributed to that category' do
      test_expense1 = Expense.create({ :description => 'Burger', :amount => 15.00, :date => '2014-04-12' })
      test_expense2 = Expense.create({ :description => 'Steak', :amount => 15.00, :date => '2014-04-11' })
      test_expense3 = Expense.create({ :description => 'Beer', :amount => 30.00, :date => '2014-04-10' })
      test_category1 = Category.create({ :name => 'Restaurant'})
      test_category2 = Category.create({ :name => 'Groceries'})
      test_cat_expense1 = Category_expenses.create({:category_id => test_category1.id, :expense_id => test_expense1.id})
      test_cat_expense2 = Category_expenses.create({:category_id => test_category1.id, :expense_id => test_expense2.id})
      test_cat_expense3 = Category_expenses.create({:category_id => test_category2.id, :expense_id => test_expense3.id})
      test_category1.percent_of_total.should eq 0.5
    end
  end
end









