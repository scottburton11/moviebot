class EndOfQueue < RuntimeError
end

class RunLimitReachedError < RuntimeError
end

class EmptyQueue < Array
   def get
      ""
   end
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

class Queue

   def initialize(host,port)
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
   
   def method_missing(meth, *args)
      server.send(meth, args)
   end
end

class QueueRunner
  def initialize(output, host, port, queue_name)
    @host = host
    @port = port
    @output = output
    @queue_name = queue_name
    @queue = Queue.new(@host, @port)
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

