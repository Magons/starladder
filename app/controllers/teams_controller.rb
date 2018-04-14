class TeamsController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :set_team, only: %i[edit update destroy]

  def index
    @teams = Team.all.includes(:owner)
  end

  def new
    @team = current_user.teams.new
  end

  def edit; end

  def create
    @team = current_user.teams.create(team_params)
    respond_with @team, location: -> { root_path }
  end

  def update
    @team.update(team_params)
    respond_with @team, location: -> { root_path }
  end

  def destroy
    @team.destroy
    respond_with @team, location: -> { root_path }
  end

  private

  def authorize
    return if current_user.present?
    flash[:warning] = 'Please LogIn!'
    redirect_to teams_path
  end

  def set_team
    @team = current_user.teams.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end
