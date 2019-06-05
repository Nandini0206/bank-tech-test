## Bank Tech Test

Practice of a tech test written in Ruby (using RSpec) - simple banking application allowing you to deposit, withdraw and view transactions.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Domain Model

<img alt="Diagram of Domain Model" src="bank-tech-test-model.jpg">

After modelling the test, I created all the relevant files (spec files and test files).
Once all the functionality was completed, the last step was to print the statement as per the requirement.

### How to Use

1. Clone the repository.
2. Run  ```bundle install``` in command line to ensure all gems are installed.
3. To run the tests use ```rspec```

### IRB
```
Nandinis-MacBook-Pro:bank-tech-test nandinipatel$ irb
2.5.0 :001 > require "./lib/account"
 => true
2.5.0 :002 > account = Account.new
 => #<Account:0x00007f8f5c859b28 @balance=0, @statement=#<Statement:0x00007f8f5c859ab0 @show=[]>>
2.5.0 :003 > account.deposit(4000)
 => [#<Transaction:0x00007f8f5d9bda90 @credit=4000, @balance=4000, @debit=0, @date=2019-06-05 11:40:28 +0100>]
2.5.0 :004 > account.withdraw(250)
 => [#<Transaction:0x00007f8f5d9bda90 @credit=4000, @balance=4000, @debit=0, @date=2019-06-05 11:40:28 +0100>, #<Transaction:0x00007f8f5d9a5378 @credit=0, @balance=3750, @debit=250, @date=2019-06-05 11:40:32 +0100>]
2.5.0 :005 > puts account.print_statement
date || credit || debit || balance
05/06/2019 || 4000.0 ||  || 4000.0
05/06/2019 ||  || 250.0 || 3750.0
2.5.0 :006 > exit
```
