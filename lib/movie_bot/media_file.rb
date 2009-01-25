require 'movie_bot/file_accessor'

class MediaFile < FileAccessor

  def initialize(path,mode="r")
    super(path, mode)
  end

  def data
    
  end

end