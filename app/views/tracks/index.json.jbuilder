json.array!(@tracks) do |track|
  json.extract! track, :id, :album_id, :title
  json.url track_url(track, format: :json)
end
