json.extract! note, :id, :name, :description, :user_id, :created_at, :updated_at
json.url note_url(note, format: :json)
