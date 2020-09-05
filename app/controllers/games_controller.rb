class GamesController < ApplicationController
  def new; end

  def create
    game = Game.new
    Rails.cache.write("games/#{game.id}", game)
    redirect_to game_path(game.id)
  end

  def show
    unless Rails.cache.exist?("games/#{params[:id]}")
      raise ActionController::RoutingError.new('Not Found')
    end

    @game = Rails.cache.read("games/#{params[:id]}")
  end

  def update
    raise ActionController::RoutingError.new('Not Found') unless request.xhr?

    render json: update_game
  end

  private

  def update_game
    @game.doors.last.attack(Action.new(id: params[:selected].split('_')[0],
                                       type: params[:selected].split('_')[1]))
    Rails.cache.read("games/#{params[:id]}")
  end
end
