class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    if project.save!
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    project = Project.find_by(id: params[:id])
    if project.update!(project_params)
      redirect_to action: :show, id: project.id
    else
      redirect_to action: :edit
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def destroy
    p '#####'
    p params[:id]
    p '#####'
    Project.destroy(params[:id])
    redirect_to projects_path
  end

  protected
  def project_params
    params.require(:project).permit :title, :description, :is_active
  end

end
