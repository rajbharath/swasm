class UserPolicy < ApplicationPolicy

  def index?
    user.has_role? :admin
  end

  def create?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin
  end

  def destroy?
    user.has_role? :admin
  end

  def manage?
    create? && update? && destroy?
  end
end
