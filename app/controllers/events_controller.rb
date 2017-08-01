class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user_event, except: [:show, :index]

  def show
    @event = Event.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @event = Event.new
  end

  def create
    project = Project.find(params[:project_id])
    event = project.events.build(event_params)
    if event.save
      redirect_to project_path(project.id)
    else
      flash[:error] = event.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to project_path(params[:project_id])
    else
      flash[:error] = event.errors.full_messages
      redirect_to action: :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to project_path(params[:project_id])
  end

  private

  def event_params
    params.require(:event).permit :title, :description, :start_date, :end_date, :image
  end

  def authorize_user_event
    authorize Event
  end
end
