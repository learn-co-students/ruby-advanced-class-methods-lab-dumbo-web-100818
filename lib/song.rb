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

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def Song.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def Song.find_or_create_by_name(name)
     if !self.find_by_name(name)
        Song.create_by_name(name)
      else
        self.find_by_name(name)
      end
  end

  def Song.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def Song.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    filename = filename.split(" - ")[1]
    song.name = filename.split(".")[0]
    song
  end

  def Song.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def Song.destroy_all
    self.all.clear
  end

end
