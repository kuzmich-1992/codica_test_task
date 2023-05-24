# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, Category
    elsif user.is? :patient
      can :manage, Consultation
    elsif user.is? :doctor
      can :manage, Consultation
    end
  end
end
