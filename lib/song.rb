require "pry"
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
  song =  Song.new()
  @@all << song
  song
  end

  def self.new_by_name(name)
    song = Song.new()
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new()
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |each_song|
      if each_song.name == name
        return each_song
      end
    end
    nil
  end

  def self.find_or_create_by_name(song_name)
    if !(find_by_name(song_name))
      create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|each_song| each_song.name}
  end

 def self.new_from_filename(file_name)
   name_and_artist = file_name.split(/[-]/)
   new_by_name(name_and_artist[1].split(/[.]/).first.strip)
   find_song = find_or_create_by_name(name_and_artist[1].split(/[.]/).first.strip)
   find_song.artist_name = name_and_artist[0].strip
   find_song
 end

 def self.create_from_filename(file_name)
   name_and_artist = file_name.split(/[-]/)
   new_by_name(name_and_artist[1].split(/[.]/).first.strip)
   find_song = find_or_create_by_name(name_and_artist[1].split(/[.]/).first.strip)
   find_song.artist_name = name_and_artist[0].strip
    @@all << find_song
 end

 def self.destroy_all
   @@all.clear
 end




















end
