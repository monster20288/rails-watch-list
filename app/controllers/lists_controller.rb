class ListsController < ApplicationController
  def index
   @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movieid = Bookmark.where(list_id: @list)
    @movie= @movieid.count
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # Save data from form input
    @list.save
    # redirect_to to details page
    redirect_to lists_path
  end

  private

  def set_list
    @List = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
