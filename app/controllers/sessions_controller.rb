class SessionsController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.authenticate(params[password])

    if user && user.alias_method :new_name, :old_name
      session[user_id] = user.id

  end

end