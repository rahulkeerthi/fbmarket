class InboxPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.where_has_user(user)
    end
  end

  def show?
    true || user.admin?
  end
end
