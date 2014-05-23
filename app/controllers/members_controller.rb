class MembersController < ApplicationController
  before_filter :authorize
  authorize_actions_for :current_group, actions: {toggle: :update, index: :read}

  def index
    authorize_action_for current_group
  end

  def toggle
    authorize_action_for current_group

    begin
      member = current_group.users.find(current_member)
      current_group.users.delete(member)
    rescue ActiveRecord::RecordNotFound
      current_group.users << current_member unless current_member == current_group.owner
    end

    respond_to do |format|
      format.js
    end
  end

  protected

  def current_group
    @group ||= Group.find(params[:group_id])
  end

  def current_member
    @member ||= User.find(params[:id])
  end
end
