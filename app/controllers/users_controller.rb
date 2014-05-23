class UsersController < Clearance::UsersController
  before_filter :authorize, only: [:show, :update, :edit]
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      redirect_to root_url, notice: 'Profile updated successfully'
    else
      render action: "show"
    end
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: 'users/new'
    end
  end

  private

  def user_from_params
    name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    location = user_params.delete(:location)
    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.location = location
      user.name = name
      user.email = email
      user.password = password
    end
  end

  def user_params
    params.require(:user).permit(:name, :location, :email, :password)
  end
end