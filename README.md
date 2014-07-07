# Filestorage

A simple file storage.

## Installation

Add this line to your application's Gemfile:

    gem 'filestorage'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filestorage

## Usage

Create a instance.

    require 'filestorage'
    storage = Filesotrage::Local.new(base_dir)

Store a file to path.

    storage.store("foo/bar/baz.txt", file)

And get the file. `get' method returns instance of File class.

    file = storage.get("foo/bar/baz.txt")
    content = file.read

## Contributing

1. Fork it ( https://github.com/takatoh/filestorage/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
