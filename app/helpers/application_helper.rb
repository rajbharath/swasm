module ApplicationHelper

  def menu_active?(menu_item_name)
    case menu_item_name
      when 'home'
        current_page? root_path
      when 'my_projects'
        current_page? user_projects_path(current_user.id)
      when 'volunteers'
        current_page? volunteers_path
      when 'about', 'contact'
        current_page? page_path(menu_item_name)
    end
  end
end
