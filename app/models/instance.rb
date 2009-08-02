require 'nokogiri'
require 'ruby-debug'
require 'open-uri'

class Instance < ActiveRecord::Base
  default_scope :order => 'hostname'

	def databases
	  doc = Nokogiri::XML(open(status_url))
		doc.xpath('//database').collect do |xml|
			name = xml.xpath('name').text
			documents = xml.xpath('documents').text
			sections = xml.xpath('documents').text
			Database.new self, name, documents, sections
		end.sort_by{ |database| database.name.downcase }
	end
	
	def name
	  hostname.split(".")[0]
  end
  
  def log_url
    action_path "grl"
  end
  
  def status_url
    action_path "getstatus"
  end
  
  private
    def action_path action
      "http://#{hostname}:#{query_port}/action=#{action}"
    end

end
