#Tracks blogs for changes
task :blog_track_engine => :environment do

  mechanize = Mechanize.new

  # page = mechanize.get('http://designbymobi.us/rss').search('item title')

  urls = %w[http://gizmodo.com/rss]
  feeds = Feedjira::Feed.fetch_and_parse urls

  feed_entries = feeds['http://gizmodo.com/rss'].entries

  feed_entries.each do |entry|
    story_object = Story.new
    story_object['title'] = entry.title
    story_object['story_url'] = entry.url
    story_object.save
  end
end