require "music_listening_tracker"

RSpec.describe MusicTracker do
    context "list songs called on empty list" do
        it "fails" do
        music_tracker = MusicTracker.new
        expect{ music_tracker.list_songs }.to raise_error "List empty!"
        end
    end

    context "add song handed empty band and empty song" do
        it "fails" do
            music_tracker = MusicTracker.new
            expect{ music_tracker.add_song("", "") }.to raise_error "Nothing entered!"
        end 
    end

    context "add song handed empty band and song" do
        it "fails" do
            music_tracker = MusicTracker.new
            expect{ music_tracker.add_song("", "Song1") }.to raise_error "Nothing entered!"
        end 
    end

    context "add song handed band and empty song" do
        it "fails" do
            music_tracker = MusicTracker.new
            expect{ music_tracker.add_song("Band1", "") }.to raise_error "Nothing entered!"
        end 
    end

    context "add song is handed a proper entry with both band and song" do
        it "returns list containing song when list is called" do
            music_tracker = MusicTracker.new
            expect(music_tracker.add_song("Band1", "Song1")).to eq true
        end 
    end

    context "add song is handed a proper entry with both band and song for two songs and then list called" do
        it "returns list" do
            music_tracker = MusicTracker.new
            music_tracker.add_song("Band1", "Song1")
            music_tracker.add_song("Blur", "Song2")
            expect(music_tracker.list_songs).to eq '{"BAND1"=>["SONG1"], "BLUR"=>["SONG2"]}'
        end 
    end

    context "two songs by one band added" do
        it "nests appropriately in the hash" do
            music_tracker = MusicTracker.new
            music_tracker.add_song("Band1", "Song1")
            music_tracker.add_song("Blur", "Song2")
            music_tracker.add_song("Band1", "Song999")
            expect(music_tracker.list_songs).to eq '{"BAND1"=>["SONG1", "SONG999"], "BLUR"=>["SONG2"]}'
        end
    end

    context "same song added twice" do
        it "fails" do
            music_tracker = MusicTracker.new
            music_tracker.add_song("Band1", "Song1")
            expect{ music_tracker.add_song("Band1", "Song1") }.to raise_error "Song already on list!"
        end
    end
end
