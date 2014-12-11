class AddSlugColumnToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :slug, :string, unique: true
  	add_index :jobs, :slug, unique: true
  end
end
