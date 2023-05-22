class UsersController < ApplicationController
  def index
    @doctors = User.where(role: 'doctor').all
    @patients = User.where(role: 'patient').all
  end
end
  