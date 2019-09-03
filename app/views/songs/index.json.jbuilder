json.array!(@songs) do |song|
  json.extract! song, :id, :text
  json.url song_url(song, format: :json)
end

