class GroupsController < ApplicationController
  before_filter :authorize
  authorize_actions_for :current_group, except: [:new, :create]

  def new
    @group = Group.new
  end

  def create
    @group        = Group.new(group_params)
    @group.owner  = current_user

    if @group.save
      redirect_to @group, notice: 'Group created successfully'
    else
      render action: 'new'
    end
  end

  def show 
  end

  def edit
  end

  def update

    if @group.update_attributes(group_params)
      redirect_to @group, notice: 'Group updated successfully'
    else
      render action: 'edit'
    end    
  end

  protected

  def current_group
    @group ||= Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :hometown, user_ids: [])
  end

end
