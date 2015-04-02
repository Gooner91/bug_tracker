class Ability
  include CanCan::Ability

  def initialize(user)

    if user.user_type.eql?"QA"
      can :read, Project
      can :read, Bug
      can :create, Bug
      can :update, Bug do |bug|
        bug && bug.creator == user
      end  
      can :destroy, Bug do |bug|
        bug && bug.creator == user
      end    
    end   
    if user.user_type.eql?"Manager"
      can :create, Project
      can :read, Project
      can :update, Project do |project|
        project && project.user == user
      end 
      can :destroy, Project do |project|
        project && project.user == user
      end    
    end
    if user.user_type.eql?"Developer"
      # can :read, Project, Project do |project|
      #   project && project.developers.include?(user)
      # end  
      can :read, Project
      can :read, Bug
      can :update_bug_status, Bug do |bug|
        bug && bug.developer == user
      end 
      can :update_status, Bug do |bug|
        bug && bug.developer == user
      end 
    end  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
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
  end
end
