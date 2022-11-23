class ApplicationController < ActionController::Base
    def LMC
      session[:c] ||= 0
      session[:c] = session[:c].to_i + 1
      render plain: session[:c]
    end
    
    private
      def current_user
        if session[:login_name]
          User.find_by(name: session[:login_name])
        end
      end
      helper_method :current_user
end
