class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist
        @@all << self
    end

    def artist=(artist)
        @artist = artist
    end
   
    def self.new_by_filename(file)
        song_data = file.split(" - ")
        song_name = song_data[1]
        song_artist = song_data[0]
        artist_class = Artist.find_or_create_by_name(song_artist)
        new_song = Song.new(song_name)
        artist_class.add_song(new_song)
        new_song
      end
   

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        @artist = artist
    end

    def self.all
        @@all
    end
end