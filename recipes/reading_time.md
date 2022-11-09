RECIPE FOR READING TIME

1. Describe the problem
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

2. Design the Method Signature
user, time, text, speed

reading_time(text) => count(int) , time to read()

"hello, how was your day?" = text

3. Create Example as Tests

reading_time("") => 0
reading_time("text with punctuation characters")
reading_time("The New Republic’s rise reduced the once-mighty Empire to a rump state hemmed in by strict disarmament treaties and punishing reparations.
    But in the galaxy’s Unknown Regions, former Imperial officers,
     nobles and technologists plotted a return to power, 
     building fleets and armies in secret. This movement became the First Order, 
     ruled by Supreme Leader Snoke, 
    and is now ready to reclaim the Imperial legacy.")
reading_time(")

4. Implement the Behaviour