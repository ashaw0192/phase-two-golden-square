# RECIPE FOR READING TIME

## 1. Describe the problem
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

   Ruby
minutes_to_read = reading_time(text)

* text is a string with words in it
* minutes_to_read is an integer representing minutes
* unless word count is below 200 but above 0, special case returns <1

## 3. Create Example as Tests

   ruby
* 1
reading_time("")
# => 0
* 2
reading_time(LESS_THAN_200_WORDS)
# => <1
* 3
reading_time(200_WORDS)
# => 1
* 4
reading_time(300_WORDS)
# => 2
* 5
reading_time(400_WORDS)
# => 2

## 4. Implement the Behaviour