using System;
using System.Collections.Generic;
using System.Linq;
namespace Assessment_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<int> numbers = new List<int>();
            string input;

            Console.WriteLine("Enter integers one by one. Type 'done' to finish.");
            int count=1;
            while (count<=5)
            {
                Console.Write($"Enter marks for subject {count} : ");
                input = Console.ReadLine();

                if (int.TryParse(input, out int number))
                {
                    numbers.Add(number);
                }
                else
                {
                    Console.WriteLine("Invalid input. Please enter a valid integer or 'done'.");
                }
                count++;
            }

            count = 1;
            while (count <= 5)
            {
                Console.Write($"subject {count} : {numbers[count-1]}\n");
                count++;
            }

            long sum = 0;
            int highest = numbers[0];
            int lowest = numbers[0];

            foreach (int num in numbers)
            {
                sum += num;
                if (num > highest)
                {
                    highest = num;
                }
                if (num < lowest)
                {
                    lowest = num;
                }
            }

            double average = (double)sum / numbers.Count;

            Console.WriteLine($"Sum: {sum}");
            Console.WriteLine($"Average: {average:F2}");
            Console.WriteLine($"Highest Number: {highest}");
            Console.WriteLine($"Lowest Number: {lowest}");

        } 
    }
}