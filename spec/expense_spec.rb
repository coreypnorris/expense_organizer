require 'spec_helper'

describe 'Expense' do
  describe '#initialize' do
    it 'initializes an instance of Expense' do
      test_expense = Expense.new({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12' })
      test_expense.should be_an_instance_of Expense
    end

    it 'initializes the instance with a description, amount, and date' do
      test_expense = Expense.new({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12' })
      test_expense.date.should eq '2014-04-12'
    end
  end

  describe '.create' do
    it 'initializes and saves a new instance' do
      test_expense = Expense.create({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12' })
      Expense.all.should eq [test_expense]
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Expense.all.should eq []
    end
    it 'should return all saved instances' do
      test_expense = Expense.create({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12' })
      Expense.all.should eq [test_expense]
    end
  end

  describe '#save' do
    it 'saves a new expense to the database' do
      test_expense = Expense.create({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12' })
      Expense.all.should eq [test_expense]
    end
  end

  describe '#==' do
    it 'should be equal to another expense if the description, amount, date, and id are equal' do
      test_expense1 = Expense.new({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12', :id => 1 })
      test_expense2 = Expense.new({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12', :id => 1 })
      test_expense1.should eq test_expense2
    end
  end

  describe '.search_by_description' do
    it 'should find the expense object based of the users input' do
      test_expense1 = Expense.create({ :description => 'Burger', :amount => 5.25, :date => '2014-04-12' })
      test_expense2 = Expense.create({ :description => 'Steak', :amount => 15.25, :date => '2014-04-11' })
      Expense.search_by_description('Steak').should eq [test_expense2]
    end
  end

end









