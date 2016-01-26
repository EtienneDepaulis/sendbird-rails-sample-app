class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def show
  	@groups = current_user.groups
  	@group = Group.find params[:id]
  end

end
