require './lib/diary_integration/diary_entry'

describe DiaryEntry do 
  context 'when initialised' do 
    it 'fails when not given valid args' do 
      expect{ DiaryEntry.new('title',[123]) }.to raise_error('Arguments must be strings')
    end 

    it 'creates an instance of DiaryEntry when given correct args' do 
      expect(DiaryEntry.new('title', 'contents')).to be_an_instance_of(DiaryEntry)
    end
  end

  describe '#title' do 
    it 'returns title when called' do 
      entry = DiaryEntry.new('title', 'contents')
      expect(entry.title).to eq('title')
    end
  end

  describe '#contents' do 
    it 'returns contents when called' do 
      entry = DiaryEntry.new('title', 'contents')
      expect(entry.contents).to eq('contents')
    end
  end

  describe '#count_words' do 
    it 'returns num of words in contents' do 
      entry = DiaryEntry.new('title', 'word ' * 200)
      expect(entry.count_words).to eq(200)
    end
  end

  describe '#reading_time' do 
    it 'returns time in minutes as int it takes to read contents of entry with given wpm' do 
      entry = DiaryEntry.new('title', 'words ' * 450)
      expect(entry.reading_time(200)).to eq(3)
    end

    it 'fails when wpm <= 0' do 
      entry = DiaryEntry.new('title', 'words ' * 450)
      expect{ entry.reading_time(-4) }.to raise_error('WPM must be positive')
    end
  end

  describe '#reading_chunk' do 
    it 'fails if wpm <= 0 or minutes <= 0' do 
      entry = DiaryEntry.new('title', 'one two three')
      expect{ entry.reading_chunk(-4, 5) }.to raise_error("wpm must be positive")
      expect{ entry.reading_chunk(4, -5) }.to raise_error("minutes must be positive")
    end 
    it  "returns full text if given enough time" do
      diary_entry = DiaryEntry.new('title','one two three')
      expect(diary_entry.reading_chunk(1,5)).to eq 'one two three'
    end
    it  "returns readable text in given time" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      expect(diary_entry.reading_chunk(1,3)).to eq 'one two three'
    end
    it  "the next chunk when previously not finished" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      diary_entry.reading_chunk(1,3)
      expect(diary_entry.reading_chunk(1,2)).to eq 'four five'
    end
    it  "restarts after finishing reading the full text exactly" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      diary_entry.reading_chunk(1,5)
      expect(diary_entry.reading_chunk(1,2)).to eq 'one two'
    end
    it  "restarts after finishing reading the full text" do
      diary_entry = DiaryEntry.new('title','one two three four five')
      diary_entry.reading_chunk(2,5)
      expect(diary_entry.reading_chunk(1,2)).to eq 'one two'
    end
  end
end 

