class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user_project, except: [:show, :index]

  def index
    @projects = Project.all

    if params[:user_id]
      @projects = User.find(params[:user_id]).volunteering_projects
    end

    current_location = Geocoder.coordinates(params[:search_location]) if params[:search_location]
    if current_location
      @projects = Project.close_to(current_location[0], current_location[1], params[:within] || 2000)
    end

    @projects
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    if project.save
      redirect_to action: :index
    else
      flash[:error] = project.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    project = Project.find_by(id: params[:id])
    if project.update(project_params)
      redirect_to action: :show, id: project.id
    else
      flash[:error] = project.errors.full_messages
      redirect_to action: :edit
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def destroy
    Project.destroy(params[:id])
    redirect_to projects_path
  end

  protected
  def project_params
    params.require(:project).permit :title, :description, :is_active, :location, :image, :plan
  end

  def authorize_user_project
    authorize Project
  end
end
