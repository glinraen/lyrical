json.array!(@songs) do |song|
  json.extract! song, :id, :title, :lyrics, :origin, :image
  json.url song_url(song, format: :json)
end
