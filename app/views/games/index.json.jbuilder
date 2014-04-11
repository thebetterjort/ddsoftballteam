json.array!(@games) do |game|
  json.extract! game, :id, :field, :start_at, :opponent, :home_score, :away_score, :win_loss
  json.url game_url(game, format: :json)
end
