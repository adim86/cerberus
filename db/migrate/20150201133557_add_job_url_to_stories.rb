class AddJobUrlToStories < ActiveRecord::Migration
  def change
    add_column :stories, :job_url, :string
  end
end
