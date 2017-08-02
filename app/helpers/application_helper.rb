module ApplicationHelper
  def menu_active?(menu_item_name)
    case menu_item_name
      when 'my_projects'
        current_page? user_projects_path(current_user.id)
      when 'volunteers'
        current_page? volunteers_path
      when 'login'
        current_page? new_user_session_path
      when 'logout'
        current_page? destroy_user_session_path
      when 'profile'
        (current_page? user_path(current_user)) or (current_page? edit_user_registration_path)
    end
  end

  def css_class_for_project_status(project_status)
    Project.statuses.keys.include?(project_status) ? project_status.tr('_', '-') : ""
  end
end
