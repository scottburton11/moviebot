#!/usr/bin/env ruby 

# Dir.glob(File.join(File.dirname(__FILE__), "movie_bot/*.rb")).each {|file| require file}
# Dir.glob(File.join(File.dirname(__FILE__), "../vendor/*/lib/*.rb")).each {|file| require file}

$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))
$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "vendor"))

require 'movie_bot/queue_manager'
require 'movie_bot/movie_maker'
require 'movie_bot/image_converter'
# require 'movie_bot/file_accessor'
# require 'movie_bot/media_file'
# require 'movie_bot/movie'

require 'rubygems'

require 'optparse' 
require 'rdoc/usage'
require 'ostruct'
require 'date'

require 'starling'

require 'uri'
require 'net/http'
require 'net/ftp'

class MovieBot
  VERSION = '0.0.2'
  
  attr_reader :options

  def initialize(arguments, stdin)
    @arguments = arguments
    @stdin = stdin
    
    # Set defaults
    @options = OpenStruct.new
    @options.verbose = false
    @options.quiet = false
    @options.output = ENV["PWD"]
    @options.mode = "standard"
    @options.queue_host = "127.0.0.1"
    @options.queue_port = "22122"
    @options.queue_name = "render"
  end

  # Parse options, check arguments, then process the command
  def run
        
    if parsed_options? && arguments_valid? 
      
      puts "Start at #{DateTime.now}\n\n" if @options.verbose
      
      output_options if @options.verbose # [Optional]
            
      process_arguments            
      process_command
      
      puts "\nFinished at #{DateTime.now}" if @options.verbose
      
    else
      output_usage
    end
      
  end
  
  protected
  
    def parsed_options?
      
      # Specify options
      opts = OptionParser.new 
      opts.on('-v', '--version')    { output_version ; exit 0 }
      opts.on('-h', '--help')       { output_help }
      opts.on('-V', '--verbose')    { @options.verbose = true }  
      opts.on('-Q', '--quiet')      { @options.quiet = true }
      opts.on('-o', '--output FILE')     { |path| @options.output = path }
      opts.on('-q', '--queue HOST:PORT:NAME')      {|opts| @options.mode = "queue"; @options.queue_host, @options.queue_port, @options.queue_name = opts.split(':') unless opts.empty?}
      opts.on('-c', '--crawl')      {@options.mode = "crawl"}
            
      opts.parse!(@arguments) rescue return false
      
      process_options
      true      
    end

    # Performs post-parse processing on options
    def process_options
      @options.verbose = false if @options.quiet
      # @options.output = "#{@options.output}/#{File.basename(@options.input)}" if File.directory?(@options.output)
      @options.output = "#{@options.output}" if (File.directory?(@options.output) && File.exists?(File.dirname(@options.output)))
    end
    
    def output_options
      puts "Options:\n"
      
      @options.marshal_dump.each do |name, val|        
        puts "  #{name} = #{val}"
      end
    end

    # True if required arguments were provided
    def arguments_valid?
      
      # true if @arguments.length == 1 && (File.directory?(@options.output) || File.exists?(File.dirname(@options.output))) && File.directory?(@options.input)
      case @options.mode
        when "queue"
          true if File.directory?(@options.output)
        when "crawl"
          true if File.directory?(@options.output) && File.directory?(@options.input?)
        else
        true if @arguments.length == 1
      end
    end
    
    # Setup the arguments
    def process_arguments
      @options.input = @arguments.first
    end
    
    def output_help
      output_version
      RDoc::usage() #exits app
    end
    
    def output_usage
      RDoc::usage('usage') # gets usage from comments above
    end
    
    def output_version
      puts "#{File.basename(__FILE__)} version #{VERSION}"
    end
    
    def process_command
      
      case @options.mode
      when "queue"
        QueueRunner.new(@options.output, @options.queue_host, @options.queue_port, @options.queue_name)
      when "crawl"
        
      else
        # images = ImageConverter.new(@options.input)
        # images.convert
        movie = MovieMaker.new(@options.input, @options.output)
        movie.convert
      end
      #process_standard_input # [Optional]
    end

    def process_standard_input
      input = @stdin.read      
      # TO DO - process input
      
      # [Optional]
      #@stdin.each do |line| 
      #  # TO DO - process each line
      #end
    end
end


# TO DO - Add your Modules, Classes, etc


# Create and run the application
# movie_bot = MovieBot.new(ARGV, STDIN)
# movie_bot.run
