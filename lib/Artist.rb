require 'pry'
class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
    self.save
  end

  def save
    @@all << self
  end

  def add_song(song)
    unless song.artist != nil
      song.artist = self
      self.songs << song
    end

  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Artist.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def genres

    songs.collect { |song| song.genre}.uniq
  end

end
