class MainController < ApplicationController

    def index
        flash.now[:notice] = "Inicio de sesión exitosa!"
        flash.now[:alert] = "Correo o contraseña incorrectos!"
    end

end