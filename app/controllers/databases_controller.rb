require 'open-uri'
class DatabasesController < ApplicationController

  def show
  	@instance = Instance.find params[:instance_id]
  	@database = @instance.databases.select{ |database| database.name == params[:id]}[0]
  end
  
  def destroy
    @instance = Instance.find params[:instance_id]
  	@database = @instance.databases.select{ |database| database.name == params[:id]}[0]
    @database.clear
    redirect_to instance_database_url(@instance.id, @database.name)
  end

end
