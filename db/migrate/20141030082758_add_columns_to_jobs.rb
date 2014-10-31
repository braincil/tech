class AddColumnsToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :deleted, :string
  	add_column :jobs, :views, :string
  end
end
