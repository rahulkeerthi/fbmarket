class ChatroomPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def show?
    true || user.admin?
  end
end
