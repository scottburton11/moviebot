class ImageConverter

#  require "rmagick"
  
  
  def initialize(home)
    @home = Dir.open(home)
    
    FileUtils.mkdir_p(["#{@home.path}/jpg"])
    @jpg_dir = Dir.open("#{@home.path}/jpg") 
  end

  def convert
    comps.each do |comp|
      image = ImMagick::Image.file(comp)
      image.convert.resize("720x486!")
      image.convert.quality("100")
      ext = ".#{image.filename.split(".").last}"
      image.save("#{@jpg_dir.path}/#{File.basename(image.filename, ext)}.jpg")
    end
  end
  
  def comps
    (Dir.entries(@home.path) - [".", ".."]).map {|file| File.expand_path(@home.path) + "/#{file}"}
  end
  
  def images
    comps.map {|frame| ImMagick::Image.file(frame)}
  end

end
