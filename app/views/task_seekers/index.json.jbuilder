json.array!(@task_seekers) do |task_seeker|
  json.extract! task_seeker, 
  json.url task_seeker_url(task_seeker, format: :json)
end
