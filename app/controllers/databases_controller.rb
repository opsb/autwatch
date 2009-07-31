class DatabasesController < ApplicationController

  def show
  	@instance = Instance.find params[:instance_id]
  	@database = @instance.databases[params[:id]]
  end

end
