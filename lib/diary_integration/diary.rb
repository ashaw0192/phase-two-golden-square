class Diary
    def initialize
        @array_of_diary_entries = []
    end
  
    def add(entry) 
      @array_of_diary_entries << entry
    end
  
    def all
        @array_of_diary_entries 
      # Returns a list of instances of DiaryEntry
    end
  
    def count_words
      @array_of_diary_entries.inject(0) { |sum, entry| sum + entry.count_words }
      # @array_of_diary_entries.sum(&:count_words)
    end
  
    def reading_time(wpm) 
        @array_of_diary_entries.inject(0) { |sum, entry| sum + entry.reading_time(wpm) }
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
        reading_times_hash = {}
        @array_of_diary_entries.each do |entry|
            reading_times_hash[entry] = entry.reading_time(wpm)
        end
        
        array = reading_times_hash.select { |_entry, time| time <= minutes }.sort_by { |_entry, time| time }.to_a
        raise "You're too slow." if array.empty?
        array[-1][0]

          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
    end
  end