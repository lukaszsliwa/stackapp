class UsersController < UserApplicationController
  def show
    @user = User.find(params[:id])
  end
end
