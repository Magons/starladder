class TournamentsController < ApplicationController
  before_action :set_tournament, except: :index

  respond_to :js, only: %I[leave participate]

  def index
    @tournaments = Tournament.all.includes(:teams)
    respond_with @tournaments
  end

  def show
    @teams = @tournament.teams.includes(:owner)
    respond_with @tournament, @teams
  end

  def participate
    @tournament.participations.create(team: current_user.team)
    respond_with @tournament
  end

  def leave
    @tournament.participations.find_by(team: current_user.team).destroy
    respond_with @tournament
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
