json.extract! event, :id, :start_date, :duration, :title, :desc, :price, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
