require 'nokogiri'
require 'ruby-debug'
require 'open-uri'

class Database
	attr_accessor :name, :documents_count, :sections
	
	def initialize(instance, name, documents_count, sections)
		@instance = instance;
		@name = name
		@documents_count = documents_count
		@sections = sections
	end
	
	def documents
    doc = Nokogiri::XML(open(list_url))
	  p doc.xpath("//DOCUMENT")
	  doc.xpath("//DOCUMENT").collect do |document|
	    title = document.xpath('DRETITLE').text
	    content = document.xpath('DRECONTENT').text
	    Document.new title, content
    end
	end
	
	def list_url
	  "http://#{@instance.hostname}:#{@instance.query_port}/action=list&DatabaseMatch=#{@name}&MaxResults=30"
	end
	
	def delete_doc_url
	  "http://#{@instance.hostname}:#{@instance.index_port}/DREDELETEREF?Docs=[document id]"
  end
	
	def clear
	  open("http://#{@instance.hostname}:#{@instance.index_port}/DREDELDBASE?DREDbName=#{name}")
  end
	
end
