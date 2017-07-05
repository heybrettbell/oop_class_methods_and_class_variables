class BankAccount
  @@interest_rate = 1.25
  @@accounts = []


  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |account|
      sum += account.balance
    end
    return sum
  end

  def self.interest_time
    @@accounts.each do |account|
      with_interest = account.balance * @@interest_rate
      account.new_balance(with_interest)
    end
  end


  def initialize
    @balance = 0
  end

  def new_balance (amount)
    @balance = amount
  end

  def balance
    return @balance
  end

  def deposit(number)
    @balance += number
  end

  def withdraw (number)
    @balance -= number
  end

end

my_account = BankAccount.create
your_account = BankAccount.create

puts my_account.balance
puts BankAccount.total_funds

my_account.deposit(200)
your_account.deposit(1000)

puts my_account.balance
puts your_account.balance

puts BankAccount.total_funds

BankAccount.interest_time

puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds

my_account.withdraw(50)

puts my_account.balance
puts BankAccount.total_funds
