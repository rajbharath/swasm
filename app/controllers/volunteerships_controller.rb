class VolunteershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    project = Project.find(params[:project_id])
    current_user.volunteering_projects << project if project and current_user.volunteering_projects.exclude? project
    redirect_to user_project_path(current_user, project)
  end

  def destroy
    project = Project.find(params[:project_id])
    current_user.volunteering_projects.delete(project) if project and current_user.volunteering_projects.include? project
    redirect_to project_path(project)
  end
end
