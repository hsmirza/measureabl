class SitePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    record.portfolio.user_id == user.id
  end

  def insight?
    record.portfolio.user_id == user.id
  end

  def show?
    record.portfolio.user_id == user.id
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
