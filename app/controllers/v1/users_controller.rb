module V1
  class UsersController < BaseController
    doorkeeper_for [:index, :show, :update, :destroy]

    def index
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_member?(@current_user)
        @users = @group.users
        respond_with @users
      else
        @users = User.all
        respond_with @users
      end
    end

    def show
      @user = User.find(params[:id])
      respond_with @user
    end

    def update
    end

    # FIXME - this route is unprotected by doorkeeper
    def create
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @user = User.find(params[:user][:user_id])
        raise NotPrivileged unless @group.is_owner?(@current_user) || @group.is_manager?(@current_user)
        @group.add_user(@user, params[:user][:group_access])
        @group.save!
      else
        # TODO - Set user admin to false here
        raise Exception if params[:user][:password] != params[:user][:password_confirmation]
        @user = User.create!(user_params)
      end

      respond_with @user
    end

    def destroy
      if params[:group_id]
        @group = Group.find(params[:group_id])
        raise NotPrivileged unless @group.is_owner?(@current_user) || @group.is_manager?(@current_user)
        @user = User.find(params[:id])
        @group.users.delete(@user)
        @group.save!
        @user.save!

        respond_with @user
      else
        raise NotPrivileged
      end
    end

    private

    def user_params
      params.required(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :phone_no)
    end
  end
end


