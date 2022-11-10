# RECIPE FOR SENTENCE CHECKER

## 1. Describe the problem
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

   ruby
is_correct = sentence_checker(text) 

* text is a valid string
* is correct is a boolean value depending on conditions met

## 3. Create example tests

   ruby
* 1
sentence_checker("")
# fail "not a sentence"

* 2
sentence_checker("hello")
# => false

* 3
sentence_checker("Hello")
# => false

* 4
sentence_checker("hello.")
# => false

* 5
sentence_checker("Hello.")
# => true

* 6
sentence_checker("Hello, how are you?")
# => true

* 5
sentence_checker("Hello, i hope you are well!")
# => true

* 6
sentence_checker("hello?")
# => false

* 7
sentence_checker("hello!")
# => false

* 8
sentence_checker("Hello,")
# => false

* 9
sentence_checker("HHHHHHHHHH!!!!!!!!!!")
# => true

## 4. Implement the behaviour