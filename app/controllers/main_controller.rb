class MainController < ApplicationController

    def index
        
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
            # flash.now[:notice] = "Inicio de sesión exitosa!"
        else
            # flash.now[:alert] = "Correo o contraseña incorrectos!"
        end
    end

end