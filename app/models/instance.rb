require 'nokogiri'
require 'ruby-debug'

class Instance < ActiveRecord::Base

	def databases
		doc = Nokogiri::XML(Net::HTTP.get URI.parse("http://#{hostname}:9000/action=getstatus"))
		databases = {}
		doc.xpath('//database').each do |xml|
			name = xml.xpath('name').text
			documents = xml.xpath('documents').text
			sections = xml.xpath('documents').text
			database = Database.new self, name, documents, sections
			databases[database.name] = database
		end
		databases
	end
	
	def status
		Nokogiri::XML(Net::HTTP.get URI.parse("http://#{hostname}:9000/action=getstatus"))
	end

end
