class EventsController < ApplicationController
  before_filter :authorize
  # remap to parent resource
  authorize_actions_for :current_group, actions: { create: :update, confirm: :update }

  def create
    authorize_action_for current_group

    @event = current_group.events.build(event_params) do |r|
      # trigger attr_accessor
      r.start_date = event_params[:start_date]
    end

    respond_to do |format|
      format.js {
        render action: @event.save ? 'create' : 'new'
      }
    end
  end

  def edit
    authorize_action_for current_group
    current_event
    respond_to do |format|
      format.js 
    end
  end

  def update
    authorize_action_for current_group
    respond_to do |format|
      format.js do 
        render action: current_event.update_attributes(event_params) ? 'update' : 'edit'
      end
    end
  end


  def like
    authorize_action_for current_group

    begin
      vote = current_event.users.find(current_user)
      current_event.users.delete(vote)
    rescue ActiveRecord::RecordNotFound
      current_event.users << current_user
    end

    respond_to do |format|
      format.js
    end
  end

  def confirm 
    authorize_action_for current_group  
    current_event.update_attribute(:confirmed_at, Time.now)  
    current_user.tweet(I18n.t('events.tweet_confirmed', 
      name: current_event.name, 
      start_date: I18n.l(current_event.start_date, format: :long), 
      location: current_event.location))

    respond_to do |format|
      format.js { render action: 'update' }
    end
  end

  protected

  def event_params
    params.require(:event).permit(:name, :location, :start_date, :duration, :description, :photo)
  end

  def current_group
    @group ||= Group.find(params[:group_id])
  end

  def current_event
    @event ||= Event.find(params[:id])
  end
end
