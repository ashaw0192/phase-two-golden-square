class MusicTracker
    def initialize
        @song_list = {}
    end

    def add_song(band, song)
        bandup = band.upcase
        songup = song.upcase
        fail "Nothing entered!" if band.empty? || song.empty?
        if !@song_list.has_key?(bandup)
            @song_list[bandup] = [songup] 
        else 
            fail "Song already on list!" if @song_list[bandup].include?(songup)
            @song_list[bandup] << songup
        end
        return true
    end

    def list_songs
        fail "List empty!" if @song_list.empty?
        return @song_list.to_s
    end
end