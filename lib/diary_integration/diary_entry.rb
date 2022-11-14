class DiaryEntry
  attr_reader :title
  attr_reader :contents
  def initialize(title, contents)
    raise 'Arguments must be strings' unless title.is_a?(String) && contents.is_a?(String)
    @title = title 
    @contents = contents
    @last_read_word = 0
  end

  def count_words
    @contents.split.count
  end

  def reading_time(wpm) 
    raise 'WPM must be positive' unless wpm.positive? 
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    raise 'wpm must be positive' unless wpm.positive?
    raise 'minutes must be positive' unless minutes.positive?
    total_words = wpm * minutes
    start_from = @last_read_word
    end_at = @last_read_word + total_words
    chunk_array = words[start_from, end_at]
    @last_read_word = if end_at >= words.length
                        0
                      else
                        end_at
                      end
    chunk_array.join(' ')
  end
            
  private

  def words
    @contents.split(' ')
  end
end