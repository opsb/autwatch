require 'uri'
class DocumentsController < ApplicationController

  def index
  	puts "gotcha"
  	@instance = Instance.find params[:instance_id]
  	@database = @instance.databases.select{ |database| database.name == params[:database_id]}[0]
  	params.each{ |param| puts param }
  	redirect_to_full_url URI.encode(@database.document_url(params[:ids])), 301
  end

end
