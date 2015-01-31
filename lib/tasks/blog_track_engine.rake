#Tracks blogs for changes
task :blog_track_engine => :environment do
  BlogTracker::Tracker.perform  
end