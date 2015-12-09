json.array!(@artists) do |artist|
  json.extract! artist, :id, :title, :biography
  json.url artist_url(artist, format: :json)
end
