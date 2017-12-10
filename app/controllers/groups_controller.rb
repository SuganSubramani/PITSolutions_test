class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    user_group_role = @group.user_group_roles.build
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    p group_params
    if @group.save
      redirect_to @group
    else
      p @group.errors
      render action: 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to @group
    else
      render action: 'edit'
    end
  end
  private
    def group_params
      params.require(:group).permit(:name,:details,user_group_roles_attributes: [:id, :user_id,:role_id,:group_id])
    end
end
