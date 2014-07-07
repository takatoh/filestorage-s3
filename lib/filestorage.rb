require "filestorage/version"
require "filestorage/local"
require "filestorage/s3_filestorage"

module Filestorage
  class NotExist < StandardError; end
  class AlreadyExist < StandardError; end
end
