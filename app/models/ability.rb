# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user
      can :manage, :all
    else
      can :read, Blogpost
      can :create, Comment
    end
  end
end
