require "filestorage/version"
require "filestorage/local"
require "filestorage/amazon_s3"

module Filestorage
  class NotExist < StandardError; end
  class AlreadyExist < StandardError; end
end
