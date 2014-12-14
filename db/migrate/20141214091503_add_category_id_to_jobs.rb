class AddCategoryIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :category_id, :integer
    add_column :jobs, :index, :string
  end
end
