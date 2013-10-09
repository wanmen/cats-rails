class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? SUPERADMIN
      can :manage, :all
    elsif user.role? ADMIN # Same as scholar
      can :read, :all
      can :create, [Book, Like, Rate]
      can :update, Book, user_id: user.id
      can :create, List, list_type: BOOKLIST
      can :update, List,  list_type: BOOKLIST, user_id: user.id
      can :manage, Taglink # TODO: Only the taglinkable owner can manage, Now we are using a workaround.
      can [:create, :destroy], Link, user_id: user.id
      can [:read, :create, :destroy], Comment, user_id: user.id
    elsif user.role? PREADMIN # Same as scholar
      can :read, :all
      can :create, [Book, Like, Rate]
      can :update, Book, user_id: user.id
      can :create, List, list_type: BOOKLIST
      can :update, List,  list_type: BOOKLIST, user_id: user.id
      can :manage, Taglink # TODO: Only the taglinkable owner can manage, Now we are using a workaround.
      can :create, Link
      can :destroy, Link, user_id: user.id
      can [:read, :create, :destroy], Comment, user_id: user.id
    elsif user.role? SCHOLAR
      can :read, :all
      can :create, [Book, Like, Rate]
      can :update, Book, user_id: user.id
      can :create, List, list_type: BOOKLIST
      can :update, List,  list_type: BOOKLIST, user_id: user.id
      can :manage, Taglink # TODO: Only the taglinkable owner can manage, Now we are using a workaround.
      can [:create, :destroy], Link, user_id: user.id
      can [:read, :create, :destroy], Comment, user_id: user.id
    elsif user.role? PRESCHOLAR
      can :read, :all
    elsif user.role? BEGINNER
      can :read, :all
    elsif user.role? BLACKLIST
      can :read, :all
    else
      can :read, :all
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
