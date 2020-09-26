class Genre
  attr_accessor :name,:songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
      self.songs << song if !self.songs.include?(song)
    unless song.genre != nil
      song.genre = self
    end

  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Genre.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    songs.collect { |song| song.artist}.uniq
  end

end
