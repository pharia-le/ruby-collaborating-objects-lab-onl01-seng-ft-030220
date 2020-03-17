require 'pry'

class Song
  
  @@all = []
  
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
    self.save
  end
    
  def artist_name=(name)
    if all_find(name)
      all_find(name)
    else
      artist = Artist.find_or_create_by_name(name)
      self.artist = artist
      artist
    end
  end
  
  def all_find(name)
    @@all.find {|song| song.artist == name }
  end
  
  def self.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    song = self.new(name)
    song.artist = Artist.new(artist)
    song
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
end