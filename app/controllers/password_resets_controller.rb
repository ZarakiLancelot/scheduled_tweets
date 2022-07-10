class PasswordResetsController < ApplicationController
    def new        
    end

    def create
        @user = User.find_by_email(params[:email])
        
        if @user.present?
            PasswordMailer.with(user: @user).password_reset.deliver_now
        end
        
        redirect_to root_path, :notice => "Email sent with password reset instructions."
    end
end