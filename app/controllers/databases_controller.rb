class DatabasesController < ApplicationController

  def show
  	@instance = Instance.find params[:instance_id]
  	@database = @instance.databases.select{ |database| database.name == params[:id]}[0]
  end

end
