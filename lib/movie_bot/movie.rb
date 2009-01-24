class Movie < MediaFile
  require 'rvideo'
  
  attr_reader :width, :height, :duration, :audio_channels, :audio_sample_rate, :video_bitrate, :video_codec, :container
  
  def initialize(path)
    super(path)
    # inspect_video(RVideo::Inspector.new(:ffmpeg_binary => APP_CONFIG['ffmpeg_binary'], :raw_response => raw_response))
    inspect_video(RVideo::Inspector.new(:file => full_path))
  end
  
  def path
    @path
  end
  
  def data
    open(@path)
  end
  
  def raw_response
    @raw_response ||= IO.popen("ffmpeg -i - 2>&1", "w") {|ffmpeg| ffmpeg.write data} #(:range => 0..40) 
  end
  
  # def inspect
  #   
  # end
  
  # Accepts an RVideo inspector object, applies inspected attributes to video items
  def inspect_video(info)
    @width = info.width
    @height = info.height
    @duration = info.duration
    @audio_channels = info.audio_channels_string
    @audio_sample_rate = info.audio_sample_rate
    @video_bitrate = info.bitrate
    @video_codec = info.video_codec
    @container = info.container
  end  
  
end