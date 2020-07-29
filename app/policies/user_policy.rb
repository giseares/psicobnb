class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record
  end

  def create?
    return false
  end

  def profile?
    user == record
  end

  def update_profile?
    user == record
  end
end
