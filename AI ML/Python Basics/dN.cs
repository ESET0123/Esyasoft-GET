using System;
using System.Collections.Generic; // To use List<T>
using System.Linq; // To use LINQ methods like .FirstOrDefault()

namespace Class_Assessment_With_Objects
{
    // Class to represent a single Bank Account
    public class BankAccount
    {
        // Properties (data fields) for the BankAccount
        // 'get' allows reading, 'private set' restricts setting to within this class
        public int AccountNumber { get; private set; }
        public string AccountHolderName { get; private set; }
        public decimal Balance { get; private set; } // Use decimal for currency to avoid precision issues

        // Constructor: This is called when a new BankAccount object is created
        public BankAccount(int accountNumber, string accountHolderName, decimal initialDeposit = 0)
        {
            // Input validation for initial deposit
            if (initialDeposit < 0)
            {
                throw new ArgumentException("Initial deposit cannot be negative.");
            }

            AccountNumber = accountNumber;
            AccountHolderName = accountHolderName;
            Balance = initialDeposit; // Set the initial balance
        }

        // Method to deposit money into the account
        public void Deposit(decimal amount)
        {
            if (amount <= 0)
            {
                Console.WriteLine("Deposit amount must be positive.");
                return;
            }
            Balance += amount; // Add amount to the balance
            Console.WriteLine($"Rs. {amount:F2} deposited. New balance: Rs. {Balance:F2}");
        }

        // Method to withdraw money from the account
        public void Withdraw(decimal amount)
        {
            if (amount <= 0)
            {
                Console.WriteLine("Withdrawal amount must be positive.");
                return;
            }
            if (amount > Balance) // Check if enough money is available
            {
                Console.WriteLine("Not enough money in account.");
                return;
            }
            Balance -= amount; // Subtract amount from the balance
            Console.WriteLine($"Rs. {amount:F2} withdrawn. New balance: Rs. {Balance:F2}");
        }

        // Method to display account details
        public void DisplayAccountDetails()
        {
            Console.WriteLine($"Bank Account Number: {AccountNumber}");
            Console.WriteLine($"Bank Account Holder Name: {AccountHolderName}");
            Console.WriteLine($"Account Balance: Rs. {Balance:F2}"); // F2 for 2 decimal places
        }
    }

    // Main program class to handle user interaction and manage BankAccount objects
    internal class Program
    {
        // Use a List to store multiple BankAccount objects
        private static List<BankAccount> accounts = new List<BankAccount>();

        static void Main(string[] args)
        {
            while (true)
            {
                try
                {
                    int choice = ShowInstruction();
                    switch (choice)
                    {
                        case 1: // Create a new bank account
                            CreateNewAccount();
                            break;
                        case 2: // Deposit money
                            PerformTransaction(account =>
                            {
                                Console.Write("Enter Deposit Amount: Rs. ");
                                if (decimal.TryParse(Console.ReadLine(), out decimal depositAmount))
                                {
                                    account.Deposit(depositAmount);
                                }
                                else
                                {
                                    Console.WriteLine("Invalid deposit amount. Please enter a number.");
                                }
                            });
                            break;
                        case 3: // Withdraw money
                            PerformTransaction(account =>
                            {
                                Console.Write("Enter Withdraw Amount: Rs. ");
                                if (decimal.TryParse(Console.ReadLine(), out decimal withdrawAmount))
                                {
                                    account.Withdraw(withdrawAmount);
                                }
                                else
                                {
                                    Console.WriteLine("Invalid withdraw amount. Please enter a number.");
                                }
                            });
                            break;
                        case 4: // Display account details
                            PerformTransaction(account => account.DisplayAccountDetails());
                            break;
                        case 5: // Exit
                            Console.WriteLine("Exited. Thank you for banking with us!");
                            return; // Exit the Main method
                        default:
                            Console.WriteLine("Wrong Choice. Please try again with a number between 1 and 5.");
                            break;
                    }
                }
                catch (FormatException)
                {
                    Console.WriteLine("Invalid input. Please enter a number for your choice.");
                }
                Console.WriteLine("\n-----------------------------------\n"); // Separator for better readability
            }
        }

        // Displays the menu and gets user's choice
        static int ShowInstruction()
        {
            Console.WriteLine("Make your choice:");
            Console.WriteLine("1. Create a new bank account");
            Console.WriteLine("2. Deposit money");
            Console.WriteLine("3. Withdraw money");
            Console.WriteLine("4. Display account details");
            Console.WriteLine("5. Exit");
            Console.Write("Enter your choice: ");
            return Convert.ToInt32(Console.ReadLine()); // Convert to int and return
        }

        // Handles the creation of a new bank account object
        static void CreateNewAccount()
        {
            Console.Write("Enter Bank Account Number: ");
            if (!int.TryParse(Console.ReadLine(), out int newAccountNumber))
            {
                Console.WriteLine("Invalid Account Number. Please enter a valid integer.");
                return;
            }

            // Check if an account with this number already exists
            if (accounts.Any(a => a.AccountNumber == newAccountNumber))
            {
                Console.WriteLine($"Account with number {newAccountNumber} already exists. Please choose a different number.");
                return;
            }

            Console.Write("Enter Bank Account holder name: ");
            string accountHolderName = Console.ReadLine();

            // Optional: Ask for an initial deposit when creating the account
            Console.Write("Enter initial deposit amount (optional, press Enter for 0): Rs. ");
            decimal initialDeposit = 0;
            string depositInput = Console.ReadLine();
            if (!string.IsNullOrWhiteSpace(depositInput) && !decimal.TryParse(depositInput, out initialDeposit))
            {
                Console.WriteLine("Invalid initial deposit amount. Setting to 0.");
                initialDeposit = 0;
            }

            try
            {
                // Create a new BankAccount object and add it to our list
                BankAccount newAccount = new BankAccount(newAccountNumber, accountHolderName, initialDeposit);
                accounts.Add(newAccount);
                Console.WriteLine($"Account for {accountHolderName} with number {newAccountNumber} created successfully.");
                newAccount.DisplayAccountDetails(); // Show details immediately
            }
            catch (ArgumentException ex)
            {
                Console.WriteLine($"Error creating account: {ex.Message}");
            }
        }

        // Helper method to find an account and then perform an action on it
        // Uses a delegate (Action<BankAccount>) for the specific operation (deposit, withdraw, display)
        static void PerformTransaction(Action<BankAccount> action)
        {
            if (accounts.Count == 0)
            {
                Console.WriteLine("No bank accounts exist yet. Please create an account first.");
                return;
            }

            Console.Write("Enter Bank Account Number to proceed: ");
            if (!int.TryParse(Console.ReadLine(), out int accountNumberToFind))
            {
                Console.WriteLine("Invalid Account Number format.");
                return;
            }

            // Find the account using LINQ
            BankAccount foundAccount = accounts.FirstOrDefault(a => a.AccountNumber == accountNumberToFind);

            if (foundAccount != null)
            {
                action(foundAccount); // Execute the action (deposit, withdraw, display) on the found account
            }
            else
            {
                Console.WriteLine($"Bank account with number {accountNumberToFind} not found.");
            }
        }
    }
}
