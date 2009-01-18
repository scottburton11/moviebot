class EndOfQueue < RuntimeError
end

class RunLimitReachedError < RuntimeError
end

class MessageQueue

  def initialize(host, port, queue)
    @host = host
    @port = port
    @queue = queue
    @m = Starling.new("#{@host}:#{@port}")
    report_usage
  end
  
  def next
    begin
      @m.get("#{@queue}")
    rescue EndOfQueue => e
      puts "#{e.message}"
      raise e
    end  
  end
  
  def report_usage
    puts "MovieBot started in Queue Mode\nListening to host #{@host}:#{@port} for queue named '#{@queue}'\nType Ctrl-C to quit"
  end
end

class QueueRunner
  def initialize(output, host, port, queue)
    @output = output
    @mq = MessageQueue.new(host, port, queue)
    run
  end
  def run
    loop do
      input = @mq.next
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

class ProcessCount
  def initialize
    processes.select{ |process| true unless (process =~ %r|#{@command.split.first}|).nil? }.size
  end

  def processes
    `ps -axwww`
  end

end
