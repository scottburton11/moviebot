class EndOfQueue < RuntimeError
end

class RunLimitReachedError < RuntimeError
end

module EmptyQueueCommands
  def available_queues
    []
  end
  
  def delete
    ""
  end
  
  def fetch
    ""
  end
  
  def flush
    ""
  end
  
  def get
    ""
  end
  
  def set
    ""
  end
  
  def sizeof
    ""
  end
  
  def with_servers
    ""
  end
end

class EmptyQueue < Array
   include EmptyQueueCommands
   
   def method_missing(meth)
      ""
   end
end

class QueueClient

  class << self
     def next(client, queue)
       begin
         client.get("#{queue}")
       rescue EndOfQueue => e
         puts "#{e.message}"
         raise e
       end  
     end
  end
end

class QueueServer

   def initialize(host, port)
    @host = host
    @port = port
   end

   def load_server
      begin
         Starling.new("#{@host}:#{@port}")
      rescue
         EmptyQueue.new
      end
   end
   
   def server
      @server ||= load_server
   end
   
   def report_usage
      puts "MovieBot started in Queue Mode\nListening to host #{@host}:#{@port}'\nType Ctrl-C to quit"
   end
   
   def method_missing(meth, *args, &block)
      @server.meth(args, block)
   end
end

class QueueRunner
  def initialize(output, host, port, queue_name)
    @host = host
    @port = port
    @output = output
    @queue_name = queue_name
    @queue = Starling.new("#{@host}:#{@port}")#QueueServer.new(@host, @port)
    run
  end
  def run
    loop do
      input = QueueClient.next(@queue, @queue_name)
      unless input.nil?
        if fork.nil?
          mov = MovieMaker.new(input, @output)
          mov.convert
          Process.wait
        end
      end
      sleep 3
    end
  end  
end

