class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_team

  def set_team
    if params[:team_id]
      session[:team_id] = params[:team_id] 
    end

    @current_team = current_team

    raise "Unknown team" if !@current_team
  end

  def current_team
    return Team.find(session[:team_id])
  end


  def team_sign_in
    render template: "team_sign_in"
  end
end
