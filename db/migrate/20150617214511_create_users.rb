class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :team
      t.string :name
      t.string :email
      t.string :password
      t.string :file
      t.timestamps 
    end
  end
end
