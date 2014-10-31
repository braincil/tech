class AddUrlToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :url, :string
    add_index :jobs, :url, unique: true
  end
end
