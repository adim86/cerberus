class AddSeenFlagToStories < ActiveRecord::Migration
  def change
    add_column :stories, :seen_flag, :boolean, default: false
  end
end
