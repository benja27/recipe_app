class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user    
      can :read, Recipe # All users can read recipes
      can :create, Recipe if user.persisted? # Logged-in users can create recipes
      can :update, Recipe, user_id: user.id # Users can update their own recipes
      can :destroy, Recipe, user_id: user.id # Users can delete their own recipes    
  end
end
