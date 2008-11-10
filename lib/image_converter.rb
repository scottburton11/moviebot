module MovieBot
  class ImageConverter

    require "rmagick"
    
    
    def initialize(home)
      @project_home = Dir.open(home)
      @comps_dir = Dir.open("#{@project_home.path}/2048x1556")
      @jpg_dir = Dir.open("#{@project_home.path}/jpg") 
    end

    # FileUtils.mkdir_p(["#{project_home.path}/jpg"])

    def convert
      comps.each do |comp|
        image = ImMagick::Image.file(comp)
        image.convert.resize("720x486!")
        ext = ".#{image.filename.split(".").last}"
        # jpg = image.scale(720,486)
        # jpg.write("#{@jpg_dir.path}/#{File.basename(image.filename, ext)}.jpg")
        image.save("#{@jpg_dir.path}/#{File.basename(image.filename, ext)}.jpg")
      end
    end
    
    def comps
      (Dir.entries(@comps_dir.path) - [".", ".."]).map {|file| File.expand_path(@comps_dir.path) + "/#{file}"}
    end
    
    def images
      comps.map {|frame| ImMagick::Image.file(frame)}
    end

  end
end