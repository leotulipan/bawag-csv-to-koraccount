# encoding: utf-8
require 'bawag-csv-convert'
require 'fakefs/safe'
# inspired by http://lukeredpath.co.uk/blog/2009/10/06/using-fakefs-with-cucumber-features/
# https://github.com/lukeredpath/moviesort/blob/master/features/support/env.rb
# and http://blog.bignerdranch.com/1572-fake-it/

	class String
		def to_bool
			return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
			return false if self == false || self.empty? || self =~ (/(false|f|no|n|0)$/i)
			raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
		end
	end


Before do
  FakeFS.activate!
end

After do
  FakeFS::FileSystem.clear
  FakeFS.deactivate!
end