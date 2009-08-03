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
	  "#{query_url}/action=list&DatabaseMatch=#{@name}&MaxResults=30"
	end
	
	def delete_doc_url
	  "#{index_url}/DREDELETEREF?Docs=[document id]"
  end

  def document_idx_url
    "#{query_url}/action=query&print=all&databasematch=#{name}&fieldtext=MATCH{[document id]}:DREREFERENCE"
  end
	
	def clear
	  open("#{index_url}/DREDELDBASE?DREDbName=#{name}")
  end
  
  private
    def query_url
      "http://#{@instance.hostname}:#{@instance.query_port}"
    end
    def index_url
      "http://#{@instance.hostname}:#{@instance.index_port}"
    end
	
end
