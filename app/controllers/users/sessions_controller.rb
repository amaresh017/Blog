class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    if signed_in?
      redirect_to articles_path, notice: "Logged in successfully"
    else
      redirect_to :back, alert: "Invalid login credentials"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

  def login_params
    params.require(:user).permit(:email,:password)
  end
end