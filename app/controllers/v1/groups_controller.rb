module V1
  class GroupsController < BaseController
    doorkeeper_for [:all]

    include AvatarHelper

    def index
      @groups = @current_user.groups
    end

    def show
      @group = Group.find(params[:id])
      raise NotPrivileged unless @group.is_member?(@current_user)
    end

    def create
      @group = Group.create!(group_params)
      @group.add_owner(@current_user)
    end

    def update
      @group = Group.find(params[:id])
      raise NotPrivileged unless @group.is_owner?(@current_user)
      @group.update!(group_params)
    end

    def destroy
      @group = Group.find(params[:id])
      raise NotPrivileged unless @group.is_owner?(@current_user)
      @group.destroy!
    end

    private

    def group_params
      params.required(:group).permit(:name, :location_attributes => [:latitude, :longitude, :address])
    end
  end
end
