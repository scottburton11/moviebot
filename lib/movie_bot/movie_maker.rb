

class ImageSequence
  def initialize(path)
    @path = path
  end
  
  def images
    
  end
  
end

class Image
  def initialize(path)
    
  end
  
  def self.extensions
    # %w"jpg png gif dpx pct bmp"
  end
end

class MovieMaker

  def initialize(input, output)
    if File.file?(input)
      @builder = MencoderMovieCreator.new(input, output)
    elsif File.directory?(input) && 
      @builder = MencoderMovieFromImagesCreator.new(input, output)
    elsif URI.regexp === input
      @builder = MencoderMovieFromURLCreator.new(input,output)
    else
      raise RuntimeError
    end
  end
  
  def convert
    @builder.convert
  end

  
  def self.make_movie_from_images(frames_path, output_path)
    jpg_dir = Dir.open("#{frames_path}")
    jpgs = "#{jpg_dir.path}/*.jpg"
    # system("mencoder mf://#{jpgs} \
    #       -mf w=720:h=486:fps=24:type=jpg \
    #       -ovc lavc \
    #       -lavcopts vcodec=mpeg4:mbd=2:trell:precmp=0:cmp=3:vbitrate=1200:vglobal=1:v4mv \
    #       -oac copy \
    #       -of lavf \
    #       -lavfopts format=mov \
    #       -o #{movie_path}/output.mov")
    # system("mencoder mf://#{jpgs} \
    #       -mf w=1024:h=778:fps=24:type=jpg \
    #       -ovc raw \
    #       -of rawvideo \
    #       -o #{movie_path}/output.mov")
    # system("mencoder mf://#{jpgs} \
    #       -mf w=2048:h=1556:fps=24:type=jpg \
    #       -ovc copy \
    #       -of lavf \
    #       -lavfopts format=mov \
    #       -vf scale=720:486 \
    #       -o #{movie_path}/output.mov ")
    # system("mencoder mf://#{jpgs} \
    #       -mf w=720:h=486:fps=24 \
    #       -ovc copy \
    #       -of lavf \
    #       -lavfopts format=mov \
    #       -o #{movie_path}/output.mov ")
    system("mencoder mf://#{jpgs} \
          -mf w=720:h=486:fps=24 \
          -ovc lavc \
          -lavcopts vcodec=mjpeg \
          -of lavf \
          -lavfopts format=mov \
          -o #{output_path} ")
    # system("mencoder mf://#{jpgs} \
    #       -mf w=720:h=486:fps=24 \
    #       -ovc lavc \
    #       -lavcopts vcodec=qtrle \
    #       -ffourcc rle \
    #       -of lavf \
    #       -lavfopts format=mov \
    #       -o #{output_path} ")
    # system("mencoder mf://#{jpgs} \
    #       -mf w=720:h=486:fps=24 \
    #       -ovc raw \
    #       -vf scale=720:486,format=yv12 \
    #       -of lavf \
    #       -lavfopts format=mov \
    #       -o #{output_path} ")
    
  end
    
end

class MencoderMovieCreator
  def initialize(input, output)
    @input = Movie.new(input)
    @output = "#{output}/#{File.basename(input)}"
  end
  
  def convert
    exec("mencoder #{@input.path} #{setting} -o #{@output}; exit 0")
  end
 
  def setting
    MencoderProfile.iphone
  end
   
end

class MencoderMovieFromImagesCreator
  def initialize(input, output)
    @input = ImageSequence.new(input)
    @output = output
  end
  
  def convert
    raise RuntimeError "Directory empty" if Dir.entries(@input).empty?
    exec('mencoder mf://#{@input.images} #{setting} -o #{@output}; exit 0')
  end
 
  def setting
    MencoderProfile.mjpeg
  end
  
end

class MencoderMovieFromURLCreator
  def initialize(input, output)
    @input = input
    @output = output
  end
  
  def convert
    exec("mencoder #{@input} #{setting} -o #{@output}/#{@input.split("/").last}; exit 0")
  end
  
  def setting
    MencoderProfile.iphone
  end
  
  
end

class MencoderProfile
  class << self
    def iphone
      "-lavfopts format=mp4 \
       -oac faac=yes \
       -faacopts mpeg=4:object=2:raw=yes:br=160 \
       -ovc x264=yes \
       -vf filmdint=crop=1904:1048:8:32,scale=480:-10,harddup,dsize=480:320:0 \
       -x264encopts nocabac:level_idc=30:bframes=0:global_header=yes:threads=auto:subq=7:frameref=6:partitions=all:trellis=1:chroma_me=yes:me=umh:bitrate=1200 \
       -fps 30000/1001 \
       -ofps 24000/1001 \
       -sws 9 \
       -of lavf=yes"
    end
    
    def mjpeg
      "-mf w=720:h=486:fps=24 \
       -ovc lavc \
       -lavcopts vcodec=mjpeg \
       -of lavf \
       -lavfopts format=mov"
    end
  end
end