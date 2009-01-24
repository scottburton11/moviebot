
class Local
  def initialize

  end
  
  
end

class HTTP
  def initialize
    
  end
  
  
end

class S3
  def initialize
    
  end
  
  
end

class FileAccessor    
  require 'ostruct'

  attr_reader :path
  
  def initialize(path, mode="r")
    @path = path
    @factory = OpenStruct.new
    @factory.local = Local
    @factory.http = HTTP
    @factory.s3 = S3
  end
  
  
  def build_accessor
    uri_prefix = %r|[a-z]*:\/\/|
    s3_prefix = %r|s3:\/\/|
    case path
    when uri_prefix
      @accessor = @factory.http.new
    when s3_prefix
      @accessor = @factory.s3.new
    else
      @accessor = @factory.local.new
    end
  end
  
  def method_missing(meth)
    @accessor.meth
  end
  
end
