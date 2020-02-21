class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else !find_by_name(name)
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song | song.name}
  end
  
  def self.new_from_filename(name)
    song = Song.new_by_name(name[1])
    name = name.split(/ - |.mp3/)
    artist_name = name[0]
  end
  
  def song.create_from_filename(filename)
    name = filename.split(/ - |.mp3/)
    song = Song.new_by_name(name[1])
    
  end
  
end
