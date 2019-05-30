class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

	def create
    @item = Item.new(title: params[:title],
                     price: params[:price],
                     image_url: params[:image_url])

    @item.photo.attach(params[:photo])
    
    if @item.save # essaie de sauvegarder en base @item
      redirect_to item_path(@item.id), :success => "Item créé !"
    else
      render 'new'
    end

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
  	@item = Item.friendly.find(params[:id])
  end

end
