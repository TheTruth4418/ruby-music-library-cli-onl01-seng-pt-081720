class Genre
  attr_accessor :name,:songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    unless song.genre != nil
      song.genre = self
      self.songs << song
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
end
