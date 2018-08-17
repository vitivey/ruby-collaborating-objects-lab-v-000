require "pry"

class Artist
  attr_accessor :name
  @@all=[]

      def initialize(name)
        @name=name
        @songs=[]
      end

      def songs
        @songs
      end

      def add_song(song)
        @songs << song
        binding.pry
      end

      def save
        @@all << self
      end

      def self.all
        @@all
      end

      def self.find_or_create_by_name(name) #name is artist string
        search = self.all.select {|instance| instance.name == name}
        if search.nil?  #if there is no artist instance
          instance = Artist.new(name)
          instance.save
          instance
        else
          instance = search.first
        end
      end

      def print_songs
        @songs.each do |song_i|
          puts song_i.name
        end

      end



end
