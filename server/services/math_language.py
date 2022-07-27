from array import array
import re

#Basic classes
class Term:
    text = ""
    def __init__(self):
        pass

    def __init__(self, text):
        self.set_data(text)

    def set_data(self, data):
        self.text = data
    
    def print(self):
        return self.text

#intermediate classes
# class Basic_Operator: #+,-,*,/,√,^
#     term1 = Term
#     basic_operator = ""
#     term2 = Term
    
#     def __init__(self):
#         pass

class Operation_Function(Term): #cos(x), sin(x), tan(x), abs(x), ln(x), log(x)... f(x), f'(x), f''(x)...
    operation_function = ""
    parameter = Term

    def __init__(self):
        pass

    def __init__(self, function_name, term: Term):
        self.set_data(function_name, term)

    def set_data(self, function_name, term: Term):
        self.operation_function = function_name
        self.parameter = term
        self.text = self.operation_function + "(" + self.parameter.print() + ")"
    
    def print(self):
        return self.operation_function + "(" + self.parameter.print() + ")"

class Expression(Term): #x+y, 2x, 2/2...
    term1 = Term
    basic_operator = ""
    term2 = Term
    
    def __init__(self):
        pass

    def __init__(self, term1: Term, basic_operator, term2: Term):
        self.set_data(term1, basic_operator, term2)

    def set_data(self, term1: Term, basic_operator, term2: Term):
        self.term1 = term1
        self.basic_operator = basic_operator
        self.term2 = term2
        self.text = self.term1.print() + self.basic_operator + self.term2.print()

    def print(self):
        return "(" + self.term1.print() + self.basic_operator + self.term2.print() + ")"

#Complex classes
class Equation: #x=y, x=2...
    lhs = Term
    rhs = Term
    comparison = ""

    def __init__(self):
        pass

    def __init__(self, lhs: Term, comparison, rhs: Term):
        self.lhs = lhs
        self.rhs = rhs
        self.comparison = comparison

    def print(self):
        return self.lhs.print() + self.comparison + self.rhs.print()

class Function(Equation): #f(x)=x
    lhs = Operation_Function

    def __init__(self):
        pass

#############################################################

a = Term("test1")
print(a.text)
a.set_data(["a", "b", [1, 2]])
print(a.text, len(a.text))
a.set_data("a")
print(a.text, len(a.text))

b1 = Term("a")
b2 = Term("b")
op = "+"

# b = Expression(b1, op, b2)
# print(b.print())

abc = Equation(Operation_Function("cos", Expression(Term("3"),"*",Expression(Term("x"),"^",Term("2")))), "!=", Expression(Expression(Term("x"),"-",Term("2")),"*",Expression(Term("x"),"+",Term("2"))))
print("Test large:")
# abc = Operation_Function("cos", Expression(Term("3"),"*",Expression(Term("x"),"^",Term("2"))))
print(abc.print())


aa = []
aa.append(Term("array test"))

print(aa[0].print())