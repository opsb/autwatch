require 'nokogiri'
require 'ruby-debug'
require 'open-uri'

class Document
  attr_accessor :title, :content
  
  def initialize(title, content)
    @title = title;
    @content = content;
  end 
    
end