class ItemsController < ApplicationController

	def new
  end

	def create
	end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

end
