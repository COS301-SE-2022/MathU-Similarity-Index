from contextlib import nullcontext


import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "147258Rs",
    database = "sim_i_db",
)
    
my_cursor = mydb.cursor()

class users:
    
    id = None
    name = None
    email = None
    password = None
    
    def __init__(self,id,name,email,password):
        self.id = id
        self.name = name
        self.email = email
        self.password = password 
        
    
    def addToTable(self):
        formula = "INSERT INTO users(UserID,UserName,Email,Password) VALUES(%s,%s,%s,%s)"
        user = (self.id,self.name,self.email,self.password)
        my_cursor.execute(formula,user)
        mydb.commit()
        print("User added to table")
        
        
        
    
    
    def deleteFromTable(self,idf):
        
        sql = "DELETE FROM users WHERE UserID = idf"
        my_cursor.execute(sql)
        mydb.commit()
        print("User deleted from table")
        
 
    
    def updateUserName(self,newname):
        sql = "UPDATE users set UserName = newname WHERE UserName = self.name"
        my_cursor.execute(sql)
        mydb.commit()
        
        print('Username updated') 
        
    
    def updateUserEmail(self,newEmail):
        sql = "UPDATE users set Email = newEmail WHERE Email = self.email"
        my_cursor.execute(sql)
        mydb.commit()
        
        print('Email updated')
            
            
    def updateUserPassword(self,newpass):
        sql = "UPDATE users set Password = newpass WHERE password = self.password"
        my_cursor.execute(sql)
        mydb.commit()
        
        print('userpassword updated ')
        
        
           
    