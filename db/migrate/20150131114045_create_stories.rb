class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :job_id
      t.string :title
      t.string :story_url
      t.string :summary

      t.timestamps
    end
  end
end
