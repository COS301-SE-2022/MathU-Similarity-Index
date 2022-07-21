import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "147258Rs",
    database = "sim_i_db",
)
my_cursor = mydb.cursor()

class problems:
    
    id = None
    problem = None
    
    def __init__(self,id,problem):
        self.id = id
        self.problem = problem
        
    def addproblems(self): 
        formula = "INSERT INTO problems(ProblemID,Problem) VALUES(%s,%s)"
        probs = (self.id,self.problem)
        my_cursor.execute(formula,probs)
        mydb.commit()
        print("Problem added to table")
        

    def deleteProblem(self,id):
        sql = "DELETE FROM problems WHERE ProblemID = id"
        my_cursor.execute(sql)
        mydb.commit()
        print("Problem deleted from table")
        
        
        
        
    
    