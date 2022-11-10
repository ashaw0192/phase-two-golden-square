# RECIPE FOR TODO

## 1. Describe the problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

task_to_track = todo(text)

* text is a valid string that may or may not contain #TODO
* task_to_track returns a boolean depending on whether task contains #TODO

## 3. Create example tests

* 1
todo("")
# fails "No text entered."

* 2
todo(TEXT_WITHOUT_TODO)
# => false

* 3
todo(TEXT_WITH_TODO_BUT_WRONG_FORMAT)
# => false

* 4
todo(TEXT_WITH_ONE_TODO)
# => true

* 5
todo(TEXT_WITH_MULTIPLE_TODO)
# => true

* 6
todo(TEXT_WITHOUT_SPACES_WITH_TODO)
# => true

## 4. Implement the behaviour