json.extract! meetup_event, :id, :description, :start_time, :place, :created_at, :updated_at
json.url meetup_event_url(meetup_event, format: :json)
