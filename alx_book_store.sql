import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Mathu@20",
    database="alx_book_store"
)

mycursor = mydb.cursor()

mycursor.execute("""
  CREATE TABLE IF NOT EXISTS Books (
    book_id PRIMARY KEY,
    title VARCHAR(130),
    author_id FOREIGN KEY REFERENCES Authors(author_id),
    price DOUBLE,
    publication_date DATE
  )
""")

mycursor.execute("""
  CREATE TABLE IF NOT EXISTS Authors (
    author_id PRIMARY KEY,
    author_name VARCHAR(215)
  )
""")

mycursor.execute("""
  CREATE TABLE IF NOT EXISTS Customers (
    customer_id PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
  )
""")

mycursor.execute("""
  CREATE TABLE IF NOT EXISTS Orders (
    order_id PRIMARY KEY,
    customer_id FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE
  )
""")

mycursor.execute("""
  CREATE TABLE IF NOT EXISTS Orders_Details (
    order_detail PRIMARY KEY,
    order_id FOREIGN KEY REFERENCES Orders(order_id),
    book_id FOREIGN KEY REFERENCES Books(book_id),
    quantity DOUBLE
  )
""")

mycursor.close()
mydb.close()
