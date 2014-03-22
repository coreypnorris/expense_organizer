class Category_expenses

  attr_reader :id, :category_id, :expense_id

  def initialize(attributes)
    @expense_id = attributes[:expense_id]
    @category_id = attributes[:category_id]
    @id = attributes[:id]
  end

  def self.create(attributes)
    new_category_expense = Category_expenses.new(attributes)
    new_category_expense.save
    new_category_expense
  end

  def self.all
    results = DB.exec("SELECT * FROM category_expenses;")
    categories = []
    results.each do |result|
      expense = result['expense_id'].to_i
      category = result['category_id'].to_i
      id = result['id'].to_i
      categories << Category_expenses.new({:id => id,:category_id => category, :expense_id => expense})
    end
    categories
  end

  def save
    result = DB.exec("INSERT INTO category_expenses (category_id, expense_id) VALUES (#{@category_id},#{@expense_id}) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(other)
    self.id == other.id && self.category_id == other.category_id && self.expense_id == other.expense_id
  end

end


  # def self.search_by_name(input)
  #   results = DB.exec("SELECT * FROM categories WHERE name = '#{input}';")
  #   found = []
  #   results.each do |result|
  #     name = result['name']
  #     id = result['id'].to_i
  #     found << Category.new({ :name => name, :id => id})
  #   end
  #   found
  # end

