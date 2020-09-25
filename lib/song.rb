require"pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new #Song.new
    @@all << song #song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song # Not Needed by test
    song  
  end

  def self.create_by_name(name)
    song = self.new # song = self.create
    song.name = name
    @@all << song # Not needed if used the .create
    song  
  end

  def self.find_by_name(name)
    self.all.find {|song|song.name == name} # self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ||
    self.create_by_name(name) # Formating this should be on the same line
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    file = filename.split(/[-.]+/)
    song = self.new_by_name(file[1].strip)
    song.artist_name = file[0].strip
    song
  end

  def self.create_from_filename (filename)
    file = filename.split(/[-.]+/)
    song = self.create_by_name(file[1].strip)
    song.artist_name = file[0].strip
    song
  end
# This are suggest for the two Sections Above
# def self.new_from_filename(filename)
#   parts = filename.split(" - ")
#   artist_name = parts[0]
#   song_name = parts[1].gsub(".mp3", "")

#   song = self.new
#   song.name = song_name
#   song.artist_name = artist_name
#   song
# end

# def self.create_from_filename(filename)
#   parts = filename.split(" - ")
#   artist_name = parts[0]
#   song_name = parts[1].gsub(".mp3", "")

#   song = self.create
#   song.name = song_name
#   song.artist_name = artist_name
#   song
# end
  def self.destroy_all
    @@all.clear
  end
  #binding.pry
  def save
    self.class.all << self
  end

end
