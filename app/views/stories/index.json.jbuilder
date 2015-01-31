json.array!(@stories) do |story|
  json.extract! story, :id, :job_id, :title, :story_url, :summary
  json.url story_url(story, format: :json)
end
