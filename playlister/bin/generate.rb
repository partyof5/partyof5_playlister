require_relative '../config/environment.rb'

parser = LibraryParser.new
parser.call

s = SiteGenerator.new
s.call