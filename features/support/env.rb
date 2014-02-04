# encoding: utf-8
require 'bawag-csv-convert'
require 'fakefs/safe'
# inspired by http://lukeredpath.co.uk/blog/2009/10/06/using-fakefs-with-cucumber-features/
# https://github.com/lukeredpath/moviesort/blob/master/features/support/env.rb
# and http://blog.bignerdranch.com/1572-fake-it/

Before do
  FakeFS.activate!
end

After do
  FakeFS::FileSystem.clear
  FakeFS.deactivate!
end