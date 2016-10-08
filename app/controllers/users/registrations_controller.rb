class Users::RegistrationsController < Devise::RegistrationsController

  # Can't do anything unless signed in
  before_filter -> { authenticate_user! force: true }, except: [:new, :create]

  def index
    if params[:approval] == '1'
      @users = User.where{ approved == false }.all
      @approval = true
    else
      @users = User.all
      @approval = false
    end
  end

  def toggle_approved
    @user = User.find(params[:id])
    @user.approved = !@user.approved
    @user.save!

    flash[:notice] = "#{@user.approved? ? 'A' : 'Una'}pproved user: #{@user.email}"
    respond_to do |format|
      format.html { redirect_to action: 'index' }
      format.js
    end
  end

  def destroy_other
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = "Removed user: #{@user.email}"
    respond_to do |format|
      format.html { redirect_to action: 'index' }
      format.js
    end
  end

protected

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    after_sign_up_path_for(resource)
  end

end
