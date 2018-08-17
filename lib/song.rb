require "pry"
class Song
  attr_accessor :name, :artist

    def initialize(name)
      @name=name
    end


    def self.new_by_filename(file) #file from MP3Importer class
      song_name = file.split("-")[1].strip  #song string
      artist_name=file.split("-")[0].strip #artist string
      
      song_i = Song.new(song_name)  #song instance
      song_i.artist=Artist.find_or_create_by_name(artist_name) #finds / creates artist instance AND adds artist instance to song instance
      song_i.artist.add_song(song_i) #adds song instance to artist instance
      song_i
    end


end
