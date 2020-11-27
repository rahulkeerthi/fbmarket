class ChatroomMessagePolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def create?
    record.user == user || user.admin?
  end
end
