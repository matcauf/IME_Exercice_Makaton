class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.has_role? :super_admin
       can :manage, :all
    elsif user.has_role? :admin
      can :manage, :all
       cannot [:update,:destroy], User, :id =>User.with_role(:super_admin, user).map(&:id)
    elsif user.has_role? :teacher
      
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :manage, User
      cannot [:assign_role,:change_role], User
      cannot [:update,:destroy], User, :id =>User.with_role(:superadmin, user).map(&:id)
      cannot [:update,:destroy], User, :id =>User.with_role(:admin, user).map(&:id)
      cannot [:update,:destroy], User, :id =>User.with_role(:teacher, user).map(&:id)
      can [:show, :update, :pictures_categories_stats, :pictures_galleries_stats, :pictures_exercices_stats],  User, :id => user.id
  
    elsif user.has_role? :user
      can [:show, :update, :pictures_categories_stats, :pictures_galleries_stats, :pictures_exercices_stats],  User, :id => user.id
    end
 
  end
end
