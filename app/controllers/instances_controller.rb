class InstancesController < ApplicationController

  def index
    @instances = Instance.all
  end

  def show
    @instance = Instance.find(params[:id])
  end

  def new
    @instance = Instance.new
  end

  def edit
    @instance = Instance.find(params[:id])
  end

  def create
    @instance = Instance.new(params[:instance])
	if @instance.save
	  flash[:notice] = 'Instance was successfully created.'
	  redirect_to(@instance)
	else
	  render :action => "new"
	end
  end

  def update
    @instance = Instance.find(params[:id])
    if @instance.update_attributes(params[:instance])
      flash[:notice] = 'Instance was successfully updated.'
      redirect_to(@instance)
    else
    end
  end

  def destroy
    @instance = Instance.find(params[:id])
    @instance.destroy
    redirect_to(instances_url)
  end
end
