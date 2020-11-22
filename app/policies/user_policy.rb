class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def follow?
    user
  end

  def unfollow?
    user
  end
end
