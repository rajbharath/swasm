class UserPolicy < ApplicationPolicy

  def index?
    user.has_role? :admin
  end

  def show?
    user.has_role? :admin or user.id == record.id
  end

  def manage?
    user.has_role? :admin
  end
end
