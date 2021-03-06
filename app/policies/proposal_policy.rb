class ProposalPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, record)
      @user = user
      @record = record
    end

    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    admin_or_owner?
  end

  def destroy
    true
  end

  private

  def admin_or_owner?
    user.admin || user.id == Job.find(record.job_id).user_id
  end
end
