# RECIPE FOR TASK TRACKER

## 1. Describe the problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the class interface

   ruby
Class MusicTracker
def initialize
    #....
end

def add_song(band, song) #band is a string containing a band name #song is a string containing a song name
returns nothing
fail if either band or song is empty
converts both to upcase for storage
end

def list_songs
return list of songs so far
fail if list empty
end

# 3. Create examples as Tests
    ruby
* 1
music_tracker = MusicTracker.new
music_tracker.list_songs
# fails "List empty!"

* 2
music_tracker = MusicTracker.new
music_tracker.add_song("", "")
# fails "Nothing entered!"

* 3
music_tracker = MusicTracker.new
music_tracker.add_song("", "Song1")
# fails "Nothing entered!"

* 4
music_tracker = MusicTracker.new
music_tracker.add_song("Band1", "")
# fails "Nothing entered!"

* 5
music_tracker = MusicTracker.new
music_tracker.add_song("Band1", "Song1")
# => returns true

* 6
music_tracker = MusicTracker.new
music_tracker.add_song("Band1", "Song1")
music_tracker.add_song("Blur", "Song2")
music_tracker.list_songs
# => {"Band1" = ["Song1"], "Blur" = ["Song2"]}

* 7 
music_tracker = MusicTracker.new
music_tracker.add_song("Band1", "Song1")
music_tracker.add_song("Blur", "Song2")
music_tracker.add_song("Band1, "Song999")
# => {"Band1" = ["Song1", "Song999"], "Blur" = ["Song2"]}

* 8 
music_tracker = MusicTracker.new
music_tracker.add_song("Band1", "Song1")
music_tracker.add_song("Band1", "Song1")
# fails "Song already on list!"

## 4. Implement the Behaviour