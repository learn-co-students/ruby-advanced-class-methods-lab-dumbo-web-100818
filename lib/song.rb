require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize (name, artist_name = "")
    @name = name
    @@all << self
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
# binding.pry
  def self.create
    self.new(name)
  end

  def self.new_by_name (name)
    self.new(name)
  end

  def self.create_by_name (name)
    self.new (name)
  end

  def self.find_by_name (name)
    @@all.find do |song|
      if song.name == name
        return song
      end
    end

  end

  def self.find_or_create_by_name (name)
    if !self.find_by_name (name)
      self.create_by_name (name)
    else
      self.find_by_name (name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename (file_name)
    @song = file_name.split(" - ")[1].split(".")[0]
    @artist_name = file_name.split(" - ")[0]
    self.new(@song, @artist_name)
    # binding.pry
  end

  def self.create_from_filename (file_name)
    @song = file_name.split(" - ")[1].split(".")[0]
    @artist_name = file_name.split(" - ")[0]
    self.new(@song, @artist_name)

  end

  def self.destroy_all
    @@all = []
  end


end
