class CreateBottlers < ActiveRecord::Migration
  def change
    create_table :bottlers do |t|
      t.string :name
      t.string :name_url, unique: true, index: true
      t.string :url
      t.text :description
      t.boolean :featured
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at

      t.timestamps null: false
    end
  end
end
