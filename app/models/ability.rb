class Ability
  include CanCan::Ability

   def initialize(user)
    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      if user.superadmin?
        can :manage, :all             # allow superadmins to do anything
      elsif user.staff?
        can :manage, [NewsComment, EventNotice, Profile, Message, EventRegistration,
                      PaperTrail::Version, Event, Notification, Sermon,
                      EventSermon, EventSermonReflection, News, SermonReflection,
                      SermonSignIn,DailyScripture,Preacher]  
        can :manage, User, :role_id => 1..2
        can :manage, Role, :id => 1..2
      end
    elsif user.approved?
      can :read, [Event, EventNotice, EventSermon, Message, Notification, Sermon,DailyScripture]
      can [:read, :update], Profile do |profile|
        profile.try(:user) == user
      end  
      can [:read, :create], NewsComment  
        can [:update, :delete], NewsComment do |news_comment|
          news_comment.try(:user) == user
        end   
      can :create, EventRegistration  
        can [:read, :update], EventRegistration do |event_registration|
          event_registration.try(:user) == user
        end
      can :create, EventSermonReflection  
        can [:read, :update], EventSermonReflection do |event_sermon_reflection|
          event_sermon_reflection.try(:user) == user || event_sermon_reflection.try(:privacy_level) == 1
        end
      can [:read, :create], News 
      can :create, SermonReflection  
        can [:read, :update], SermonReflection do |sermon_reflection|
          sermon_reflection.try(:user) == user || sermon_reflection.try(:privacy_level) == 1
        end 
      can [:create], SermonSignIn 
      can :read, SermonSignIn do |sermon_sign_in|
          sermon_sign_in.try(:user) == user
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
 
