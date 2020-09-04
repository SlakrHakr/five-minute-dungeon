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

  def update
    raise ActionController::RoutingError.new('Not Found') unless request.xhr?

    render json: update_game
  end

  private

  def update_game
    Rails.cache.read("games/#{params[:id]}")
  end

  def generate_initial_game
    {
      boss: params[:boss],
      doors: generate_initial_doors,
      players: [
        {
          hero: params[:hero],
          name: params[:name],
          hand: general_initial_hand
        }
      ]
    }
  end

  def general_initial_hand
    [2, 17, 89]
  end

  def generate_initial_doors
    [71, 123, 12, 87, 230]
  end
end
