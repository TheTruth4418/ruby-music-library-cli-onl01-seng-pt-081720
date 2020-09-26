require 'pry'
class Artist
  extend Concerns::Findable
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

    self.songs << song if !self.songs.include?(song)

    unless song.artist != nil
      song.artist = self
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
