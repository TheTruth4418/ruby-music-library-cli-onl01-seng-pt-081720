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

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      song = Song.create(name)
    else
      self.find_by_name(name)
    end
  end

def self.new_from_filename(name)
  file_name = name.split(" - ")
  song_name = file_name[1]
  song = Song.new(song_name)
  song.artist = file_name[0]
end

end

# binding.pry
