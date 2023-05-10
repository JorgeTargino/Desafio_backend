json.extract! event_history, :id, :subscription_id, :type, :created_at, :updated_at
json.url event_history_url(event_history, format: :json)
