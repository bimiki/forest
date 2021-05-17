json.extract! notes_task, :id, :name, :description, :status, :notes_id, :created_at, :updated_at
json.url notes_task_url(notes_task, format: :json)
