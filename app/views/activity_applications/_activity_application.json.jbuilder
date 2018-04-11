json.extract! activity_application, :id, :user_id, :meetup_event_id, :name, :description, :duration, :tags, :created_at, :updated_at
json.url activity_application_url(activity_application, format: :json)
