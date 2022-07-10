class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
            # flash.now[:notice] = "Inicio de sesión exitosa!"
            # flash.now[:alert] = "Correo o contraseña incorrectos!"
        end
    end
end
