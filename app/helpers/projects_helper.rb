module ProjectsHelper
  def remaining_attributes_count(project)
    project.specifications ? project.specifications.length : 0
  end
end
