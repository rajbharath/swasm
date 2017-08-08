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
    permitted_params = project_params
    permitted_params[:specifications] = transform_specifications(project_params[:specifications])
    project = Project.new(permitted_params)
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
    permitted_params = project_params
    permitted_params[:specifications] = transform_specifications(project_params[:specifications])
    project = Project.find_by(id: params[:id])
    if project.update(permitted_params)
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
    params.require(:project).permit :title, :description, :is_active, :location, :image_before, :image_after, :plan, :status, specifications: [:name, :value]
  end

  def transform_specifications(raw_specifications)
    specifications = Hash.new
    raw_specifications.each do |raw_specification|
      specifications[raw_specification['name']] = raw_specification['value'] unless (raw_specification['name'].empty? || raw_specification['value'].empty?)
    end
    specifications
  end

  def authorize_user_project
    authorize Project
  end
end
