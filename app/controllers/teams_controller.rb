class TeamsController < ApplicationController
  
  def index
    @teams = Team.all
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to team_url(@team)
    else
      flash.now[:errors] = @team.errors.full_messages
#      fail
      render :new
    end
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to team_url(@team)
    else
      flash.now[:errors] = @team.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_url
  end
end
