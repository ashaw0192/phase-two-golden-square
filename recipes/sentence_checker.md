1. Describe the problem
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature
sentence_checker(text) - text is a string
need to check beginning and end of sentence
begins with capital
ends with (. ? !)

3. Create example tests
[".", "!", "?"] =  if text[-1] in array
text.starts_with?(/[A-Z]/)
end



4. Implement the behaviour