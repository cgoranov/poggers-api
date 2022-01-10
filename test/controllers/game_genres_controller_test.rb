require "test_helper"

class GameGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_genre = game_genres(:one)
  end

  test "should get index" do
    get game_genres_url, as: :json
    assert_response :success
  end

  test "should create game_genre" do
    assert_difference('GameGenre.count') do
      post game_genres_url, params: { game_genre: { game_id: @game_genre.game_id, genre_id: @game_genre.genre_id } }, as: :json
    end

    assert_response 201
  end

  test "should show game_genre" do
    get game_genre_url(@game_genre), as: :json
    assert_response :success
  end

  test "should update game_genre" do
    patch game_genre_url(@game_genre), params: { game_genre: { game_id: @game_genre.game_id, genre_id: @game_genre.genre_id } }, as: :json
    assert_response 200
  end

  test "should destroy game_genre" do
    assert_difference('GameGenre.count', -1) do
      delete game_genre_url(@game_genre), as: :json
    end

    assert_response 204
  end
end
