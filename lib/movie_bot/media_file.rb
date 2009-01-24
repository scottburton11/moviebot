class MediaFile < FileAccessor

  def initialize(path,mode="r")
    @path = path
    super @path, mode
  end

  def data
    
  end

end