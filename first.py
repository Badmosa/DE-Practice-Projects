salary = 100000
bonus_rate = 0.1
job_id = 101


company_name = 'Zacrac.'
job_title = 'Data Analyst'
job_salary = 100000
job_work_from_home = True
print(company_name)



for n in range(3):
    password = input("Password: ")

    if password == "adesola":
        print("Welcome to Home page")

        break
    else:
        print("Password is incorrect.")
else:
    print("Suspicious activity. The authorities have been alerted.")


sum_of_evens = 0
for n in range(1, 100):
    if n % 2 == 0:
        sum_of_evens = sum_of_evens + n
print(sum_of_evens)


try:
    number = int(input("Enter an integer"))
except ValueError:
    print("This is not an integer")


def divide(num1, num2):
    try:
        print(num1 / num2)
    except TypeError:
        print("both arguments must be numbers")

    except ZeroDivisionError:
        print("num2 must not be 0")


number = input("enter a string")
try:
    n = int(input("enter an intiger: "))
    print(f"The character at index {n} is:{text[n]}")

except ValueError:
    print("erreor: the munber must be an intiger.")

except IndexError:
    print("error: your index is out of bound.")


import random

def coin_flip():
    if random.randint(0, 1) == 0:
        return "heads"
    else:
        return "tail"

coin_head = 0
coin_tail = 0

for swap in range(10_000):
    if coin_flip() == "heads":
        coin_head = coin_head + 1
    else:
        coin_tail = coin_tail + 1

ratio = coin_head / coin_tail
print(f"the ratio of head to tail is {ratio}")


import random

def poll():
    if random.randint(0, 1) == 0:
        return "first_number"
    else:
        return "second_number"
    

first_number = 0
second_number = 10_000

for i in range(second_number):
    if poll() == 1 + 1
        print()
    else:
        print()

average_number = first_number / second_number
print(f"the average of first and second number is {average_number}")


# challenge: election simulation
from random import random

num_of_time_A_wins = 0
num_of_time_B_wins = 0
num_of_trials = 10_000

for trial in range(1, num_of_trials):
    candidate_A_vote = 0
    candidate_B_vote = 0

if  random() < 90:
    candidate_A_vote = candidate_A_vote + 1
else:
    candidate_B_vote = candidate_B_vote + 1

if random() < 70:
    candidate_A_vote = candidate_A_vote + 1
else:
    candidate_B_vote = candidate_B_vote + 1

if random() < 50:
    candidate_A_vote = candidate_A_vote + 1
else:
    candidate_B_vote = candidate_B_vote + 1

if candidate_A_vote > candidate_B_vote:
    num_of_time_A_wins = num_of_time_A_wins + 1
else:
    num_of_time_B_wins = num_of_time_B_wins + 1

print(f"probability that candidate A win: {num_of_time_A_wins / num_of_time_B_wins}")
print(f"probability that candidate B win: {num_of_time_B_wins / num_of_time_A_wins}")


#
def get_second_element (item):
    return item[1]

item = [(4,1), (1,2), (-9,0)]
item.sort(key=get_second_element)

item

# loop
data = ((1,4), (2,6))

index = 1

for num in data:
    print(f"num {index} sum: {sum(num)}")
    index += 1