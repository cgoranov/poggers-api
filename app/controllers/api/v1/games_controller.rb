class Api::V1::GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

  
  def index
    @games = Game.all

    render json: @games, except: [:created_at, :updated_at], include: {
        comments: {
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
      render json:{status: 201, game: @game}, status: :created, location: api_v1_game_path(@game), except: [:created_at, :updated_at], include: {
        comments: {
            except: [:created_at, :updated_at]
        }
    }
    else
        render json: {status: 422 , errors: @game.errors.full_messages.join(", ")}, status: :unprocessable_entity
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
    if @game.destroy
      render json: {message: "Successfully deleted", store: @store}
    else
      render json: {message: "Failed to delete"}
    end
  end

  private
    
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :platform, comment_attributes:[:content])
    end

end
