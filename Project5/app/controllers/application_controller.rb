class ApplicationController < ActionController::Base
    helper_method :authorized
    helper_method :current_user
    helper_method :logged_in?
    helper_method :all_users
    helper_method :all_courses
    helper_method :all_application
    
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def authorized
        redirect_to '/' unless logged_in?
    end

    def all_users
        User.all
    end

    def all_courses
        course = Course.all
        course.uniq
    end

    def all_application
        Application.all 
    end

end
