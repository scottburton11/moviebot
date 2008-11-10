module MovieBot
  class MovieMaker

  def self.make_movie_from_frames(frames_path, &output_path)
    jpg_dir = Dir.open("#{frames_path}")
    jpgs = "#{jpg_dir.path}/*.jpg"
    output_path ||= File.dirname(frames_path)
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
          -o #{output_path}/output.mov ")
  end
    
  end
end