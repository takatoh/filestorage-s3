# encoding: utf-8

require 'pathname'
require 'fileutils'

module Filestorage

  class LocalFilestorage
  
    def initialize(base_dir)
      @base_dir = Pathname.new(base_dir)
    end

    def store(path, file)
      fullpath = @base_dir + path
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
      File.open(fullpath, "rb")
    end

  end   # of class LocalFilestorage

end   # of module LocalFilestorage
