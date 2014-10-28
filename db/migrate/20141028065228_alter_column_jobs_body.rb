class AlterColumnJobsBody < ActiveRecord::Migration
  def change
  	change_column :jobs, :body, :text
  end
end
