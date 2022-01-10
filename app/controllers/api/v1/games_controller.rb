class Api::V1::GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

  
  def index
    @games = Game.all

    render json: @games, except: [:created_at, :updated_at], include: {
        genres: {
            except: [:created_at, :updated_at]
        }
    }
  end

  
  def show
    render json: @game, except: [:created_at, :updated_at], include: {
        genres: {
            except: [:created_at, :updated_at]
        }
    }
  end

  
  def create
    
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: api_v1_game_path(@game), except: [:created_at, :updated_at], include: {
        genres: {
            except: [:created_at, :updated_at]
        }
    }
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @game.destroy
  end

  private
    
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :platform, :release_month, genre_attributes:[:name])
    end

end
