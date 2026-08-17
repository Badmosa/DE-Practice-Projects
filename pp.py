def multiply(x, y):
    return x * y

result = multiply(5, 3)
print(result)


num = float(input("Enter a number: "))
while num <=0:
    print("Invalid input. Please enter a number greater than 0.")
    num = float(input("Enter a number: "))


for letter in 'python':
    
    print(letter)


word = 'python programming'
index = 0
while index< len(word):
    print(word[index])
    index += 1


    for n in range(3):
        print("Python")

for n in range(10,20):
    print(n*n)



amount = float(input("Enter an amount: "))

for num_of_person in range(2, 6):
    print(f"Amount per person for {num_of_person} people: {amount / num_of_person:.2f}")


for n in range(1, 4):
    for j in range(4, 7):
        print(f"n = {n} and j = {j}")


for n in range(2):
    print(n + 1)


x = "Hello World"
def func():
    x = 2

print(f"Inside 'func', x has the value {x}")
func()
print(f"Outside 'func', x has the value {x}")


x = 5
def outer_func():
    y = 10
    def inner_func():
        z = x * y
        return z

    return inner_func()

total = 0
def add_to_total(n):
    global total
    total = total + n
add_to_total(5)
print(total)  # Output: 5


# boolean comperators or expressionsor operators
1 <= 1 # True
3 < 4 # True
10 > 5 # True
"jack" < "jill" # True
42 == 42 # True
1 != 1 # False
1 != 2 # True
"good" != "bad" # True
"good" != "Good" # True
123 == 123 # True


# The logical operators in Python are used to combine conditional statements. 
# The three logical operators are and, or, and not.
# and Keyword.
True and True # True
True and False # False
False and False # False
True or True # True
True or False # True
False or False # False
# Grouping expressions with parentheses is a great way to clarify which
# operators belong to which part of a compound expression
False ==(not True) # True
True == (not False) # True
False == (not False) # False
True == (not True) # False
True == True # True
False == False # True

True and not (1 != 1) # True
True and False and (not True) # Fals
True or False # True
False and (not False) # False

# all ti return True
False == (not True) # False
True and False == True and False # True
not True and ("A" == "B" ) # meaning
False and False == False and False # True


if  2 + 2   == 5:
    print("2 and 2 is 5")
else:
    print("error in  calculation")


students = [
    ("John", 85),
    ("Sarah", 72),
    ("David", 68),
    ("Mary", 61),
    ("Peter", 55),
    ("Grace", 50),
    ("James", 43),
    ("Esther", 35),
    ("Michael", 78),
    ("Blessing", 64)
]

for student_name, Grade in students:
    if Grade >= 70:
        print(student_name, "A")
    elif Grade >= 60:
        print(student_name, "B")
    elif Grade >= 50:
        print(student_name, "C")
    else:
        print("You have failed the test")




store_tk = input("enter a product name: ")

if len(store_tk) > 5:
    print("product variable lenght is greater than 5")

elif len(store_tk) < 5:
    print("product variable lenght is less than 5")

else:
    print(f"product name is {store_tk}")

 


number = int(input("Enter a positive number: "))

for num in range(1, number + 1):
    if number % num == 0:
        print(f"{num} is a factor of {number}")


