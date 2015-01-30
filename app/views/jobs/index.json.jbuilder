json.array!(@jobs) do |job|
  json.extract! job, :id, :url, :interval, :last_run
  json.url job_url(job, format: :json)
end
