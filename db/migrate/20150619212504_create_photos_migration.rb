class CreatePhotosMigration < ActiveRecord::Migration
  def change
    create_table :uploader do |t|
      t.string :file
      t.timestamps
    end
  end
end
