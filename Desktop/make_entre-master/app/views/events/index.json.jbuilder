json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :place, :content
  json.url event_url(event, format: :json)
end
