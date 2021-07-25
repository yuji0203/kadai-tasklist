class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  # def index
  # @pagy, @users = pagy(User.order(id: :desc), items: 25)
  # end

  # def show
  # @user = User.find(params[:id])
  # @pagy, @tasks = pagy(@user.tasks.order(id: :desc))
  #   counts(@user)
  # end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to '/'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end