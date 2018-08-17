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
      end

      def save
        @@all << self
      end

      def self.all
        @@all
      end

      def self.find_or_create_by_name(name)
        search = self.all.select {|instance| instance.name == name}
        if search.nil?
          instance = search.first
        else
          instance=Artist.new(name)
          instance.save
        end
        binding.pry
      end

      def print_songs
        @songs.each do |song_i|
          puts song_i.name
        end

      end



end
