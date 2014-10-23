class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :body
      t.string :company
      t.boolean :sticky
      t.string :location

      t.timestamps
    end
  end
end
