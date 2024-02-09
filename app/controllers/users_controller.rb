class UsersController < ApplicationController
  def index 
    @list_of_users = User.all.order({ :username => :asc })
    render({ :template => "user_templates/index"})
  end

  def show 

    url_username = params.fetch("username")

    @user = User.where({ :username => url_username }).first

    if @user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show" })
    end
  end
end
