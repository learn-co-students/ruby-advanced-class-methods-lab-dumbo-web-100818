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
    new_song = Song.new
    @@all.push(new_song)
    new_song
  end

  def self.new_by_name(title)
    new_song = Song.new
    new_song.name = title
    @@all.push(new_song)
    new_song
  end

  def self.create_by_name(title)
    new_song = Song.new
    new_song.name = title
    @@all.push(new_song)
    new_song
  end

  def self.find_by_name(title)
    self.all.find{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if find_by_name(title)
      return find_by_name(title)
    else
      create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    new_song = Song.new
    file_name.chomp!(".mp3")
    file_name_array = file_name.split(" - ")
    new_song.name = file_name_array[1]
    new_song.artist_name = file_name_array[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    @@all.push(new_song)
  end

  def self.destroy_all
    @@all.clear
  end

end
