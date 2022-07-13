class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists:id
  def show; end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
