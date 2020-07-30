class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def show?
    true
  end
end
