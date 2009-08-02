load '/Users/searle-barneso/Development/railsprojects/autwatch/lib/rxmlslurper.rb'
require 'open-uri'
doc = Nokogiri::XML(open("http://dev-aut2.nl.informatm.com:9000/action=getstatus"))