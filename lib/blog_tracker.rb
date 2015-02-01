module BlogTracker
  class Tracker
    class << self

      def perform
        job_urls = Job.pluck(:url)
        
        feeds = Feedjira::Feed.fetch_and_parse job_urls

        job_urls.each_with_index do |job, index|
          feed_entries = feeds[job].entries

          #Feed comeback with newest on top we like it bac
          feed_entries.reverse!

          last_story = Story.where(:job_url => job).order("created_at").last
          puts last_story
          if (last_story.blank?)
            add_new_stories(feed_entries, job)
          else
            populate_new_stories(feed_entries, last_story, job)
          end
        end
      end

      def add_new_stories(new_entries, job_url)
        new_entries.each do |new_entry|
          story_object = Story.new
          story_object['title'] = new_entry.title
          story_object['story_url'] = new_entry.url
          story_object['job_url'] = job_url
          story_object.save

          puts new_entry.title
        end
      end


      def populate_new_stories(feed_entries, last_story, job_url)
        found_title_at = -1

        feed_entries.each_with_index do |entry, index|

          if(entry.title == last_story.title)
            found_title_at = index
          end

        end

        if( found_title_at != -1 && found_title_at != feed_entries.length - 1)

          new_story_array = feed_entries.slice(found_title_at + 1, feed_entries.length)

          puts "new stories = #{new_story_array.length}"
          add_new_stories(new_story_array, job_url)
        end
      end

    end
  end
end