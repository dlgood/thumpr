class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :user
      t.string :role
      t.string :goal
      t.string :benefit
      t.string :fftext
      t.string :assignee
      t.integer :priority
      t.boolean :visible
      t.boolean :completed
      t.datetime :completed_at
      t.timestamps
    end
  end
end
