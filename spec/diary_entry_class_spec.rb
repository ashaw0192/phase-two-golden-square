require "diary_entry_class"

RSpec.describe DiaryEntry do
    it "gathers the two inputs" do
        diary_entry = DiaryEntry.new("Babe", "Pig in the City")
        expect(diary_entry.title).to eq "Babe"
        expect(diary_entry.contents).to eq "Pig in the City"
    end
    describe "#count_words" do
        it "returns the number of words in contents" do
            diary_entry = DiaryEntry.new("Babe", "Pig in the City")
            expect(diary_entry.count_words).to eq 4
        end
    end
    describe "#reading_time" do
        context "Given valid wpm" do
            it "returns an estimate of time to read" do
                diary_entry = DiaryEntry.new("Babe", "Pig in the City with some more words included")
                expect(diary_entry.reading_time(2)).to eq 5
            end
        end

        context "given 0 wpm" do
            it "fails" do
                diary_entry = DiaryEntry.new("Babe", "Pig in the City with some more words included")
                expect{ diary_entry.reading_time(0) }.to raise_error "Error"
            end
        end
                


    end

    describe "#reading_chunk" do
        context "given a reading_speed greater than length of text" do
            it "returns the contents" do
                diary_entry = DiaryEntry.new("Babe", "Pig in the City with some more words included")
                expect(diary_entry.reading_chunk(200,2)).to eq "Pig in the City with some more words included"
            end
        end

        context "given multiple reading speeds smaller than contents" do
            it "returns chunks" do
                diary_entry = DiaryEntry.new("Babe", "Pig in the City with some more words included")
                diary_entry.reading_chunk(2,2)
                expect(diary_entry.reading_chunk(2, 2)).to eq "with some more words"
            end
        end

        context "given multiple reading speeds larger than contents" do
            it "returns full contents each time" do
                diary_entry = DiaryEntry.new("Babe", "Pig in the City")
                diary_entry.reading_chunk(400,2)
                expect(diary_entry.reading_chunk(400, 2)).to eq "Pig in the City"
            end
        end
    end
end
