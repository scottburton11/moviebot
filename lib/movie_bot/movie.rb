require 'movie_bot/media_file'
require 'rvideo'

class Movie < MediaFile
  
  
  attr_reader :width, :height, :duration, :audio_channels, :audio_sample_rate, :video_bitrate, :video_codec, :container, :raw_response
  
  def initialize(path, mode="r")
    super(path, mode)
    # read_raw_response
    inspect_video(RVideo::Inspector.new(:raw_response => raw_response))
  end
  
  def raw_response
    ffmpeg = IO.popen("ffmpeg -i #{@path} 2>&1", "r")
    ffmpeg.read
  end

  
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