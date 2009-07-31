class Database
	attr_accessor :name, :documents, :sections
	
	def initialize(instance, name, documents, sections)
		@instance = instance;
		@name = name
		@documents = documents
		@sections = sections
	end
	
	def list_url
		"http://#{@instance.hostname}:9000/action=list&DatabaseMatch=#{@name}&MaxResults=30"
	end
	
end
