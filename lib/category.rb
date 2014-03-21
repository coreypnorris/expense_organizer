class Category

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.create(attributes)
    new_category = Category.new(attributes)
    new_category.save
    new_category
  end

  def self.all
    results = DB.exec("SELECT * FROM categories;")
    categories = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      categories << Category.new({ :name => name, :id => id})
    end
    categories
  end

  def percent_of_total
    results = DB.exec("SELECT * FROM category_expenses WHERE category_id = #{self.id};")
    expenses = []
    total = 0
    results.each do |result|
      expenses << result['expense_id'].to_f
    end
    Expense.all.each do |expense|
      expenses.each do |cat|
        if expense.id == cat
          total += expense.amount
        end
      end
    end
    total=total/Expense.total_amount
  end

  def save
    result = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(other)
    self.name == other.name
  end



  def self.search_by_name(input)
    results = DB.exec("SELECT * FROM categories WHERE name = '#{input}';")
    found = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      found << Category.new({ :name => name, :id => id})
    end
    found
  end

end
