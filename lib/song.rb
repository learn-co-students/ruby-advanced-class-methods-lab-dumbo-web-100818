require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

    # def initialize(name,artist_name)
    # @name = name
    # @artist_name = artist_name
    # self.class.all << self
  #end
  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_from_filename(file)
    song = self.new
    song.name = (file.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (file.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    song

  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  def save
    self.class.all << self
  end

end
