class ItemsController < ApplicationController
  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user
    if @item.save
      redirect_to current_user
    else
      flash.now[:alert] = "An error ouccurred. Please try again."
      redirect_to current_user
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:alert] = 'Item destroyed!'
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js {}
    end
  end
end
