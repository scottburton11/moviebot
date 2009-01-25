
class Local
  def initialize(path, mode)
    mode = mode
    path = path
    @file = open(path, mode)
  end
  
  def method_missing(meth, *args, &block)
    @file.send(meth.to_sym, *args, &block)
  end

end

class HTTP
  def initialize(path, mode)
    mode = mode
    path = path
    @url = URI.parse(path)
  end
  
  
  def read
    req = Net::HTTP::Get.new(@url.path)
    res = Net::HTTP.start(@url.host, @url.port) {|http|
      http.request(req)
    }
    return res.body
  end
  
  
  def method_missing(meth)
    @file.send(meth.to_sym)
  end
  
end

class S3
  def initialize
    
  end
  
end

class FileAccessor    
  require 'ostruct'
  require 'open-uri'
  attr_reader :path
  
  def initialize(path, mode="r")
    @path = path
    @mode = mode
    build_accessor
    # Delegator.new(@accessor)
  end
  
  def build_accessor
    f = OpenStruct.new
    f.local = Local
    f.http = HTTP
    f.s3 = S3
    uri_prefix = %r|[a-z]*:\/\/|
    s3_prefix = %r|s3:\/\/|
    case @path
    when uri_prefix
      @accessor = f.http.new(@path,@mode)
    when s3_prefix
      @accessor = f.s3.new(@path,@mode)
    else
      @accessor = f.local.new(@path,@mode)
    end
  end
  
  def method_missing(meth, *args, &block)
    @accessor.send(meth.to_sym, *args, &block)
  end
  
end
