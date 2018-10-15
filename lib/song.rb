require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end
# <Song:0x007fb4bea3a7a8 (name in @@all)
# <Song:0x007fb4bea3a7a8 output


  def self.find_or_create_by_name(name)
  self.find_by_name(name) ||  self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name)
    song = name.split(" - ")
    artist_name = song[0]
    real_song_name = song[1].split(".")
    song_name = real_song_name[0]
    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end
