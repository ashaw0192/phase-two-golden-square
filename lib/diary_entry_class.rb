class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      # ...
      @title = title
      @contents = contents
      @progress = 0
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      words.length
    end
  
    def reading_time(wpm)
        fail "Error" if wpm < 1
        (count_words/wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) 
        reading_speed = wpm * minutes
        chunk = words[@progress...reading_speed + @progress]
        @progress += reading_speed
        @progress = 0 if @progress > count_words
        return chunk.join(" ")
    end

    private

    def words
        @contents.split
    end
  end