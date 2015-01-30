class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :url
      t.integer :interval
      t.datetime :last_run

      t.timestamps
    end
  end
end
