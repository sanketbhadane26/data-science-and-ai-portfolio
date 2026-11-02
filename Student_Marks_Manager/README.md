# Student Marks Manager

A Python console-based Student Marks Manager built using **Python and PostgreSQL**.

The project allows users to add, view, search, update, delete, and analyze student records through a menu-driven interface

The project is organized into multiple Python modules to make the code easier to understand, maintain, and extend.

---

## Features

- Add a student and their marks
- View all students
- Search a student by name
- Search a student by roll number
- Update student marks
- Delete a student
- View student statistics
- Calculate total number of students
- Calculate average marks
- Find the top student
- Automatically generate student roll numbers
- Export student records to CSV
- Handle nonexistent students
- Handle invalid marks
- Handle invalid roll numbers
- Handle invalid menu choices
- Handle empty student names
- Store student data in PostgreSQL
- Use parameterized SQL queries
- Separate the project into multiple Python modules
- Use a virtual environment
- Manage project dependencies using `requirements.txt`

---

## Menu

```text
1. Add Student
2. View Students
3. Search by Name
4. Search by Roll Number
5. Update Student
6. Delete Student
7. Statistics
8. Export Students to CSV
9. Exit

Technologies Used
- Python
- PostgreSQL
- psycopg2-binary
- SQL
- Git
- GitHub
Concepts Used
- Python Variables
- Input / Output
- if-else
- while loop
- Functions
- match-case
- Exception Handling
- Lists
- Classes and Objects
- Object-Oriented Programming
- Modular Programming
- PostgreSQL
- psycopg2
- SQL Queries
- Parameterized Queries
- CRUD Operations
- Database Transactions
- SQL Aggregate Functions
- Input Validation
- CSV File Handling
- Virtual Environments
- Project Dependency Management
Project Structure
Student-Marks-Manager/
│
├── venv/                       # Virtual environment (not uploaded to GitHub)
│
├── screenshots/
│   ├── menu.png
│   ├── search.png
│   └── statistics.png
│
├── main.py
├── student.py
├── database.py
├── utils.py
├── requirements.txt
├── .gitignore
└── README.md

File Description
main.py
Contains the main program flow and menu-driven interface.
Responsible for:
- Displaying the menu
- Taking user input
- Calling the required functions
- Handling menu operations
- Controlling the overall program flow
- Exporting student data to CSV
student.py
Contains the Student class.
Responsible for storing:
- Student roll number
- Student name
- Student marks
Example:
class Student:    def __init__(self, name, marks, roll_number=None):        self.roll_number = roll_number        self.name = name        self.marks = marks


database.py
Handles the PostgreSQL database connection and database-related operations.
Responsible for:
- Connecting to PostgreSQL
- Creating the student table
- Adding students
- Searching students
- Searching by roll number
- Updating marks
- Deleting students
- Retrieving all students
- Calculating statistics
- Executing SQL queries
- Using parameterized queries
utils.py
Contains helper functions used by the program.
Responsible for:
- Validating student names
- Validating marks
- Validating roll numbers
- Validating menu choices
- Handling invalid input
Database Structure
The program creates a PostgreSQL table named:
STUDENT_MANAGER

Column	Type	Description
ID	SERIAL PRIMARY KEY	Automatically generated student roll number
NAME	VARCHAR(20)	Student name
MARKS	INT	Student marks


The ID column is used as the student's roll number.
CRUD Operations
The project implements all four basic CRUD operations.
Create
Add a new student to the database.
Enter student name: Sanket
Enter student's marks: 85

Read
View all students or search for a specific student.
Update
Update the marks of an existing student using their roll number.
Delete
Delete a student using their roll number.
How It Works
The program connects to a PostgreSQL database and provides a menu-driven interface for performing different operations.
Add Student
The user enters:
Enter student name: Sanket
Enter student's marks: 85

The student is then stored in the PostgreSQL database.
The database automatically generates the student's roll number.
View Students
The program retrieves all students from the PostgreSQL database and displays their:
- Roll number
- Name
- Marks
Search by Name
The user enters a student's name:
Enter student name: Sanket

The program searches the database and displays matching students.
Search by Roll Number
The user enters a roll number:
Enter roll number: 1

The program finds and displays the student associated with that roll number.
Update Student
The user enters the student's roll number and provides new marks.
Example:
Enter roll number: 1
Enter new marks: 95

The program updates the student's marks in the database.
Delete Student
The user enters the student's roll number.
The program asks for confirmation before deleting the student.
Statistics
The program calculates and displays:
- Total number of students
- Average marks
- Top student
Example:
--- Statistics ---

Total Students: 5
Average Marks: 82.40
Top Student: Sanket
Marks: 95

CSV Export
The project can export student records to a CSV file.
The generated file is:
students.csv

Example:
Roll No,Name,Marks
101,Rahul,85
102,Amit,91
103,Sanket,95

This feature uses Python's built-in csv module, so no additional package is required.
Input Validation
The program handles invalid user input without crashing.
Invalid Marks
Example:
Enter student's marks: abc

Please enter a valid number.

Marks outside the range 0–100 are also rejected.
Example:
Enter student's marks: 120

Marks must be between 0 and 100.

Invalid Roll Number
Example:
Enter roll number: abc

Please enter a valid roll number.

Invalid or non-positive roll numbers are rejected.
Empty Name
Example:
Enter student name:

Name cannot be empty.

Invalid Menu Choice
Example:
Enter your choice: 15

Please enter a choice between 1 and 9.

Student Not Found
If a student does not exist:
Student not found.

The program continues running instead of crashing.
Virtual Environment
This project uses a Python virtual environment.
Create the virtual environment using:
python -m venv venv

Activate it on Windows:
.\venv\Scripts\Activate.ps1

The terminal should show:
(venv)

before the project path.
The virtual environment keeps the project's Python dependencies isolated from the rest of the system.
Requirements
Project dependencies are stored in:
requirements.txt

Install the dependencies using:
pip install -r requirements.txt

The main external dependency used by this project is:
psycopg2-binary

PostgreSQL Setup
Make sure PostgreSQL is installed and running.
Create the database used by the program:
db1

The database configuration is currently handled in:
database.py

Update the database configuration if required for your local PostgreSQL setup.
Example:
db_name = "db1"db_host = "localhost"db_user = "postgres"db_password = 1234db_port = 5432


Do not upload real database passwords or credentials to GitHub.

For a more secure version, database credentials can be moved to environment variables in a future improvement.
How to Run
1. Make sure Python is installed
Check your Python installation:
python --version

2. Clone the repository
git clone <your-repository-url>

Move into the project directory:
cd Student-Marks-Manager

3. Create a virtual environment
python -m venv venv

4. Activate the virtual environment
Windows PowerShell:
.\venv\Scripts\Activate.ps1

5. Install dependencies
pip install -r requirements.txt

6. Make sure PostgreSQL is running
Create the required database:
db1

Update the PostgreSQL credentials in database.py if required.
7. Run the program
python main.py