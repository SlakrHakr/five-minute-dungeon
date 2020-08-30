class GamesController < ApplicationController
  def new; end

  def create
    game_id = SecureRandom.urlsafe_base64
    Rails.cache.write("games/#{game_id}", generate_initial_game)
    redirect_to game_path(game_id)
  end

  def show
    unless Rails.cache.exist?("games/#{params[:id]}")
      raise ActionController::RoutingError.new('Not Found')
    end

    @game = Rails.cache.read("games/#{params[:id]}")
    @game[:id] = params[:id]
  end

  private

  def generate_initial_game
    {
      boss: 99,
      doors: [71, 123, 12, 87, 230],
      players: [
        {
          hero: 86,
          hand: [2, 17, 89]
        }
      ]
    }
  end
end
