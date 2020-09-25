require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist != nil
    self.genre= genre if genre != nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
    genre.songs << self if !genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

# binding.pry
