class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    return false
  end

  def profile?
    user == record
  end

  def update_profile?
    record.professional
  end
end
