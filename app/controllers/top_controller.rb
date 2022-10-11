class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    def login
        uses = Use.find_by(uid: params[:uid])
        login_password = BCrypt::Password.new(uses.pass)
        if login_password == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'error'
        end
    end
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end