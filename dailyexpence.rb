class Expense
  attr_reader :amount, :category, :description, :date
  def initialize(amount, category, description)
    @amount = amount
    @category = category
    @description = description
    @date = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
  def to_s
    "$#{'%.2f' % @amount} - #{@category} - #{@description} (#{@date})"
  end
 end
 class ExpenseTracker
  def initialize
    @expenses = []
  end
  def add_expense(amount, category, description)
    if amount <= 0
      puts " Amount must be a positive number!"
    elsif category.strip.empty?
      puts " Category cannot be empty!"
    else
      @expenses << Expense.new(amount, category, description)
      puts "Expense added successfully!"
    end
  end
  def view_expenses
    if @expenses.empty?
      puts "No expenses recorded yet!"
    else
      puts "\nAll Expenses:"
      @expenses.each_with_index do |expense, index|
        puts "#{index + 1}. #{expense}"
      end
    end
  end
  def total_expenses
    total = @expenses.sum(&:amount)
    puts "\nTotal Expenses: $#{'%.2f' % total}"
  end
 end

 def expense_tracker
  tracker = ExpenseTracker.new
  loop do
    puts "\nWelcome to the Expense Tracker!"
    puts "1. Add an Expense"
    puts "2. View All Expenses"
    puts "3. Calculate Total Expenses"
    puts "4. Exit"
    print "Choose an option (1-4): "
    choice = gets.chomp.to_i
    case choice
    when 1
      print "Enter the amount (e.g., 50): "
      amount = gets.chomp.to_f
      print "Enter the category (e.g., Food, Travel): "
      category = gets.chomp
      print "Enter a description : "
      description = gets.chomp
      tracker.add_expense(amount, category, description)
    when 2
      tracker.view_expenses
    when 3
      tracker.total_expenses
    when 4
      puts "Goodbye!"
      break
    else
      puts "Invalid choice. Please enter a number between 1 and 4."
    end
  end
 end
 
 expense_tracker