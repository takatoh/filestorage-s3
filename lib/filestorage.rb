require "filestorage/version"
require "filestorage/local_filestorage"

module Filestorage
  class NotExist < StandardError; end
  class AlreadyExist < StandardError; end
end
