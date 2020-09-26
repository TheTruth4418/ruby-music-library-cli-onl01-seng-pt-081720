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

  def self.new_from_filename(filename)
      array = filename.split(" - ")

      song_name = array[1]
      artist_name = array[0]
      genre_name = array[2].split(".mp3").join

      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      self.new(song_name, artist, genre)
    end

end

# binding.pry
