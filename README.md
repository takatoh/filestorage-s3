# Filestorage-S3

A simple file storage for Amazon S3.

## Installation

Add this line to your application's Gemfile:

    gem 'filestorage-s3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filestorage-s3

## Usage

Create a instance.

    require 'filestorage-s3'
    bucket = Filesotrage::AmazonS3.new(bucketname, access_key_id, secret_access_key)

Store a file to path.

    bucket.store("foo/bar/baz.txt", file)

And get the file. `get' method returns instance of AWS::S3::S3Object class.

    obj = bucket.get("foo/bar/baz.txt")
    content = obj.read

## Contributing

1. Fork it ( https://github.com/takatoh/filestorage-s3/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
