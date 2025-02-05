import mysql.connector

def create_database():
    try:
        # Establish the connection
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Mathu@20'
        )
        
        if connection.is_connected():
            cursor = connection.cursor()

            # Create the database
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
            
            print("Database 'alx_book_store' created successfully!")
            
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    
    finally:
        # Clean up and close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()