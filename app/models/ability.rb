class Ability
  include CanCan::Ability

  def initialize user
    can %i(read), Book
    can %i(read create), Order
    can %i(read), OrderDetail

    if user&.admin?
      can :manage, :all
    elsif user&.user?
      can %i(create update destroy), OrderDetail
      can %i(read update), User, id: user.id
    else
      return
    end
  end
end
