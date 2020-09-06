class GroupsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def index 
    @groups = Group.all
  end

  def show
    @egroup = Group.find(params[:id])
    #@attendees = User.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.created_groups.build(group_params)
    if @group.save
      flash.notice = 'Group created'
      redirect_to @group
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:group).permit(:name, :icon)
  end
end