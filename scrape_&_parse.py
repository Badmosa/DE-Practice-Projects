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