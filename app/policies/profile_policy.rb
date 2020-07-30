class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == User.find(record.user_id)
  end

  def update?
    record.professional
  end
end
