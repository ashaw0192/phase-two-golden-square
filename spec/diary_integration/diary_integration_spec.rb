require './lib/diary_integration/diary.rb' 
require './lib/diary_integration/diary_entry'

RSpec.describe 'integration' do
    describe "#all" do
        it "returns all entries" do
            diary = Diary.new
            diary_entry_one = DiaryEntry.new("jan", "cold")
            diary_entry_two = DiaryEntry.new("feb", "cold still")
            diary.add(diary_entry_one)
            diary.add(diary_entry_two)
            expect(diary.all).to eq [diary_entry_one, diary_entry_two]
        end
    end

    describe "#count_words" do
        it "returns the number of words contained in contents of all entries as int" do
            diary = Diary.new
            diary_entry_one = DiaryEntry.new("jan", "cold")
            diary_entry_two = DiaryEntry.new("feb", "cold still")
            diary.add(diary_entry_one)
            diary.add(diary_entry_two)
            expect(diary.count_words).to eq 3
        end
    end

    describe "#reading_time" do
        it "returns time to read all the entries" do
            diary = Diary.new
            diary_entry_one = DiaryEntry.new("jan", "cold " * 200)
            diary_entry_two = DiaryEntry.new("feb", "cold still " * 200)
            diary.add(diary_entry_one)
            diary.add(diary_entry_two)
            expect(diary.reading_time(200)).to eq 3
        end
    end

    describe "#define_best_entry_for_reading_time" do
        it "fails if all diary entries are too chunky" do
            diary = Diary.new
            diary_entry_one = DiaryEntry.new("jan", "cold " * 200)
            diary.add(diary_entry_one)
            expect{ diary.find_best_entry_for_reading_time(2, 2) }.to raise_error "You're too slow."
        end

        it "returns the entry if it's got the exact amount of words readible in given time" do
            diary = Diary.new
            diary_entry_two = DiaryEntry.new("jan", "cold " * 200)
            diary_entry_one = DiaryEntry.new("feb", "colder " * 400)
            diary_entry_three = DiaryEntry.new("mar", "coldest " * 100)
            diary.add(diary_entry_two)
            diary.add(diary_entry_one)
            diary.add(diary_entry_three)
            expect(diary.find_best_entry_for_reading_time(50, 2)).to eq diary_entry_three
        end
    
        it "returns the entry with closest without going over reading ability amount of words" do
            diary = Diary.new
            diary_entry_two = DiaryEntry.new("jan", "cold " * 200)
            diary_entry_one = DiaryEntry.new("feb", "colder " * 400)
            diary_entry_three = DiaryEntry.new("mar", "coldest " * 100)
            diary.add(diary_entry_two)
            diary.add(diary_entry_one)
            diary.add(diary_entry_three)
            expect(diary.find_best_entry_for_reading_time(150, 2)).to eq diary_entry_two
        end
    end
end
