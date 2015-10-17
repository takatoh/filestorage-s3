# encoding: utf-8

require 'aws'


module Filestorage

  class AmazonS3
  
    def initialize(bucket, access_key_id, secret_access_key)
      @s3 = AWS::S3.new(:access_key_id     => access_key_id,
                        :secret_access_key => secret_access_key)
      @bucket = @s3.buckets[bucket]
    end

    def store(path, file)
      obj = @bucket.objects[path]
      raise AlreadyExist.new("Already exist #{path}") if obj.exists?
      content = if file.instance_of?(Pathname)
        File.open(file, "rb"){|f| f.read}
      elsif file.instance_of?(File)
        file.read
      else
        file
      end
      obj.write(content, :acl => :public_read)
      path
    end

    def get(path)
      obj = @bucket.objects[path]
      raise NotExist.new("Not exist #{path}") unless obj.exists?
      obj
    end

    def delete(path)
      obj = @bucket.objects[path]
      raise NotExist.new("Not exist #{path}") unless obj.exists?
      obj.delete
      path
    end

    def exist?(path)
      obj = @bucket.objects[path]
      obj.exists?
    end

    def files
      files = []
      @bucket.objects.each do |obj|
        files << obj.key
      end
      files
    end

  end   # of class AmazonS3

end   # of module Filestorag
