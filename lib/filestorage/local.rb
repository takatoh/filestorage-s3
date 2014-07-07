# encoding: utf-8

require 'pathname'
require 'fileutils'

module Filestorage

  class Local
  
    def initialize(base_dir)
      @base_dir = Pathname.new(base_dir)
    end

    def store(path, file)
      fullpath = @base_dir + path
      raise AlreadyExist.new("Already exist #{path}") if File.exist?(fullpath)
      FileUtils.mkdir_p(fullpath.parent)
      if file.instance_of?(Pathname)
        FileUtils.cp(file, fullpath)
      elsif file.instance_of?(File)
        File.open(fullpath, "wb") do |f|
          f.write(file.read)
        end
      else
        File.open(fullpath, "wb") do |f|
          f.write(file)
        end
      end
      path
    end

    def get(path)
      fullpath = @base_dir + path
      raise NotExist.new("Not exist #{path}") unless File.exist?(fullpath)
      File.open(fullpath, "rb")
    end

    def delete(path)
      fullpath = @base_dir + path
      raise NotExist.new("Not exist #{path}") unless File.exist?(fullpath)
      FileUtils.rm(fullpath)
      path
    end

    def exist?(path)
      fullpath = @base_dir + path
      File.exist?(fullpath)
    end

  end   # of class Local

end   # of module LocalFilestorage
