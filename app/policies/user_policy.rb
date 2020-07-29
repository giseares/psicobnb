class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
    # user == record
  end

  def create?
    return false
  end

  def profile?
    user == record
  end
end
