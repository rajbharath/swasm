class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    current_location = Geocoder.coordinates(params[:location]) if params[:location]
    if current_location
      @projects = Project.close_to(current_location[0], current_location[1], params[:within] || 2000)
    else
      @projects = Project.all
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
    params.require(:project).permit :title, :description, :is_active, :location, :image
  end

end
