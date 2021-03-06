class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
     
      if user.role.name == "Admin"
         can :manage, :all
      else
         can [:read, :create, :update], Job
      end
   end
end
