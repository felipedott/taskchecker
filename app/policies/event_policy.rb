class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    return update?
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def calendar?
    true
  end

  def sync_event_with_google?
    true
  end
end
