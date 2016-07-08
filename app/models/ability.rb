class Ability
  include CanCan::Ability

   def initialize(user)
    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      if user.superadmin?
        can :manage, :all             # allow superadmins to do anything
      elsif user.staff?
        can :manage, [Profile, Message, EventRegistration,PaperTrail::Version, Event]  
        can :manage, User, :role_id => 1..2
        can :manage, Role, :id => 1..2
      end
    elsif user.approved?
      can :manage, [Event,EventRegistration,News]
        can [:read, :update], Profile do |profile|
          profile.try(:user) == user
        end  
    else
        can :create, Profile  
        can [:read, :update], Profile do |profile|
          profile.try(:user) == user
        end   
    end
  end
end
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
 
