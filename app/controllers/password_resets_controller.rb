class PasswordResetsController < ApplicationController
    def new        
    end

    def create
        @user = User.find_by_email(params[:email])
        
        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        
        redirect_to root_path, :notice => "Email sent with password reset instructions."
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, :alert => "Invalid or expired password reset link."
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, :notice => "Password has been reset."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end