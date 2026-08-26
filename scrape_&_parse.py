from urllib.request import urlopen

url = "http://olympus.realpython.org/profiles/aphrodite"
html_page = urlopen(url)
html_text = html_page.read().decode("utf-8")
print(html_text)


# Parsing Techique
from urllib.request import urlopen

url = "http://olympus.realpython.org/profiles/aphrodite"

page = urlopen(url)
text = page.read().decode("utf-8")

start_tag = "<title>"
end_tag = "</title>"

start_index = html_text.find(start_tag) + len(start_tag)
end_index = html_text.find(end_tag)

print(html_text[start_index:end_index])



# maching cases
# print function would print priint output for all
import re
re.findall("ab*c", "ac")

re.findall("ab*c", "abcd")

re.findall("ab*c", "acc")

re.findall("ab*c", "abcac")

re.findall("ab*c", "abdc")




# using "IGNORECASE" because maching cases are very sensitive
re.findall("ab*c", "ABC")

re.findall("ab*c", "ABC", re.IGNORECASE)


# Using period (.) to stand for a single character in any regular expression
re.findall("a.c", "abc")

re.findall("a.c", "abbc")

re.findall("a.c", "ac")

re.findall("a.c", "acc")


# The term ".*" inside of a regular expression stands for any character repeated any number of times. more than once.
re.findall("a.*c", "abc")

re.findall("a.*c", "abbc")

re.findall("a.*c", "ac")

print(re.findall("a.*c", "acc"))


# Method of matching results woth "search" and "group()"
match_results = re.search("ab*c", "ABC", re.IGNORECASE)
print(match_results.group())

# re.sub() function: for passing out text. short for "substitute"
# It allows to replace text in a string that matches a regular expression with new text
# Greedy "<.*>": Uses the longest string
string = "EVERYTHING IS <REPLACED> IF IT'S IN <tags>."
string = re.sub("<.*>", "ELEPHANTS", string)
print(string)


# Non-greedy "<.*?>": Uses the shortest string
string = "Everything is <replaced> if it's in <tags>."
string = re.sub("<.*?>", "ELEPHANTS", string)
print(string)



# parsing out title from: http://olympus.realpython.org/profiles/dionysus
import re
from urllib.request import urlopen
url = "http://olympus.realpython.org/profiles/dionysus"
page = urlopen(url)
html = page.read().decode("utf-8")
pattern = "<title.*?>.*?</title.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
title = match_results.group()
title = re.sub("<.*?>", "", title) # Remove HTML tags
print(title)


# * → "Give me everything." can generate a lot of data from html during web scraping
# *? → "Okay, give me the minimum." can generate littlle data to satisfaction from html during web scraping

# exercise 1: Write a script that grabs the full HTML from the page: "http://olympus.realpython.org/profiles/dionysus"
import re
from urllib.request import urlopen
url = "http://olympus.realpython.org/profiles/dionysus"

# Exercise 2
for tag in ["Name: ", "Favorite Color: "]:
    tag_start = html_text.find(tag) + len(tag)
    tag_end = html_text[tag_start:].find("<")
# Removing extra spaces and newline padding
    print(html_text[tag_start : tag_start + tag_end].strip(" \n"))


# Exercise 3
# Get the "Name" and "Favorite Color" using regular expressions
# import re

# # Match anything up until a new line or HTML tag; non-greedy
# for tag in ["Name: .*?[\n<]", "Favorite Color: .*?[\n<]"]:
#     match_results = re.search(tag, html_text)
# # Removing the "Name: " or "Favorite Color: " label from first result
#     result = re.sub(".*: ", "", match_results.group())
# # Removing extra spaces and newline padding along with opening HTML tag
#     print(result.strip(" \n<"))

# Match anything up until a new line or HTML tag; non-greedy
import re

for tag in ["Name: .*?[\n<]", "Favorite Color: .*?[\n<]"]:
    match_results = re.search(tag, html_text)

    if match_results:
        result = re.sub(".*: ", "", match_results.group())
        print(result.strip(" \n<"))
    else:
        print("No match found for:", tag)


from bs4 import BeautifulSoup

from urllib.request import urlopen
url = "http://olympus.realpython.org/profiles/dionysus"
page = urlopen(url)
html = page.read().decode("utf-8")
soup = BeautifulSoup(html, "html.parser")
print(soup.get_text())
print(soup.find_all("img"))
print(soup.title.string)

# mechanicalsoup
import mechanicalsoup

#1
browser = mechanicalsoup.Browser()
url = "http://olympus.realpython.org/login"
login_page = browser.get(url)
login_html = login_page.soup

#2
form = login_html.select("form")[0]
form.select("input")[0]["value"] = "zeus"
form.select("input")[1]["value"] = "ThunderDude"

#3
profiles_page = browser.submit(form, login_page.url)
print(profiles_page.url)


# how too provide URL for links
links = profiles_page.soup.select("a")

for link in links:
    address = link["href"]
    text = link.text
print(f"{text}: {address}")


base_url = "http://olympus.realpython.org"
for link in links:
    address = base_url + link["href"]
    text = link.text
print(f"{text}: {address}")

# scrape to get result
import mechanicalsoup
browser = mechanicalsoup.Browser()
page = browser.get("http://olympus.realpython.org/dice")
tag = page.soup.select("#result")[0]
result = tag.text
print(f"The result of your dice roll is: {result}")


# 5 sec time pause to print: I'm amazed!
import time

print("I'm about to wait for five seconds...")
time.sleep(5)
print("Done waiting!")


# 30 sec: WOW!
import time

import mechanicalsoup
browser = mechanicalsoup.Browser()
for i in range(4):
    page = browser.get("http://olympus.realpython.org/dice")
    tag = page.soup.select("#result")[0]
    result = tag.text
print(f"The result of your dice roll is: {result}")
time.sleep(30)

# As much as I liked  this, its a waste of time; stopping it the "IF" statement...
import time

import mechanicalsoup
browser = mechanicalsoup.Browser()
for i in range(4):
        page = browser.get("http://olympus.realpython.org/dice")
tag = page.soup.select("#result")[0]
result = tag.text
print(f"The result of your dice roll is: {result}")

# Wait 30 seconds if this isn't the last request
if i < 3:

    time.sleep(30)