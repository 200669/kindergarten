class GroupsController < ApplicationController
  before_action :check_logged_in
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  
  def index
    @groups = Group.all
  end
  
  def show
  end
  
  def new
    @group = Group.new
  end
  
  def edit
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:info] = "Grupa dodana pomyślnie"
      redirect_to @group
    else
      render :new
    end
  end
  
  def update
    if @group.update(group_params)
      flash[:info] = "Dane grupy zapisane"
      redirect_to @group
    else
      render :edit
    end
  end
  
  def destroy
    @group.destroy
    flash[:info] = "Grupa usunięta"
    redirect_to groups_url
  end
  
  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
