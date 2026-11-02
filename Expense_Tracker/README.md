Expense Tracker

A simple command-line Expense Tracker built with Python to practice functions, lists, dictionaries, file handling, and date/time operations.

Features
Add Expense
View Expenses
Save Expenses to File
Load Saved Expenses
Calculate Monthly Total

Date Handling with datetime
Menu-driven interface

Concepts Used
Python Functions
Lists
Dictionaries
match/case
if/else
for loops
User Input
File Handling
datetime
String Formatting
How It Works

The program stores each expense as a dictionary:

{
    "name": "Lunch",
    "amount": 150,
    "date": "26-08-2026",
    "category": "Food"
}

Multiple expenses are stored inside a list.

The user can then choose different options from the menu:

1. Add Expense
2. View Expenses
3. Save Expenses
4. Load Expenses
5. Monthly Total
6. Exit
Date Format

Enter dates in:

DD-MM-YYYY

Example:

26-08-2026

The program uses Python's datetime module to process the date and calculate monthly expenses.

File Storage

Expenses are saved in a text file:

expenses.txt

Each expense is stored in a readable format

Lunch | 150.0 | 26-08-2026 | Food
Bus | 40.0 | 26-08-2026 | Travel
How to Run

Make sure Python is installed.

Run:

python expense_tracker.py

Then choose an option from the menu.

What I Learned

While building this project, I learned how to:

Store multiple records using a list of dictionaries
Use functions to organize program logic
Use match/case for menu selection
Read and write data to a file
Convert a string into a datetime object
Access the month from a date
Calculate totals using loops
Build a practical command-line application
Future Improvements
Load saved expenses directly into the expense list
Add expense deletion and editing
Filter expenses by category
Calculate yearly totals
Improve the user interface
Use JSON or a database for better data storage
Author

Sanket Bhadane

Computer Engineering Student

This project is part of my Python learning journey.