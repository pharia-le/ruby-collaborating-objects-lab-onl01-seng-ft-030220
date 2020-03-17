require 'pry'

class Artist 
  
  @@all = []
  
  attr_accessor :name 
  
  def initialize(name)
    @name = name
    self.save
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end
  
  def self.find_or_create_by_name(name)
    if self.all_find(name)
      self.all_find(name)
    else
      artist = self.new(name)
    end
  end
  
  def self.all_find(name)
    self.all.find {|artist| artist.name == name }
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
end