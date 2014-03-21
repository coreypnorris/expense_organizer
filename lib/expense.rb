class Expense

  attr_reader :description, :amount, :date, :id

  def initialize(attributes)
    @description = attributes[:description]
    @amount = attributes[:amount]
    @date = attributes[:date]
    @id = attributes[:id]
  end

  def self.create(attributes)
    new_expense = Expense.new(attributes)
    new_expense.save
    new_expense
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      amount = result['amount'].to_f
      date = result['date']
      id = result['id'].to_i
      expenses << Expense.new({ :description => description, :amount => amount, :date => date, :id => id })
    end
    expenses
  end

  def save
    result = DB.exec("INSERT INTO expenses (description, amount, date) VALUES ('#{@description}', #{@amount}, '#{@date}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(other)
    self.description == other.description && self.amount == other.amount && self.date == other.date && self.id == other.id
  end

  def self.search_by_description(input)
    results = DB.exec("SELECT * FROM expenses WHERE description = '#{input}';")
    found = []
    results.each do |result|
      description = result['description']
      amount = result['amount'].to_f
      date = result['date']
      id = result['id'].to_i
      found << Expense.new({ :description => description, :amount => amount, :date => date, :id => id })
    end
    found
  end



end
