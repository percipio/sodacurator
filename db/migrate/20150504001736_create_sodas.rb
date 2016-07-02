class CreateSodas < ActiveRecord::Migration
  def change
    create_table :sodas do |t|
      t.string :title
      t.text :preview
      t.text :body
      t.text :url
      t.date :release_date
      t.integer :rating
      t.boolean :featured
      t.string :title_url, unique: true, index: true
      t.boolean :published, default: false
      t.integer :bottler_id, null: false
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at

      t.timestamps null: false
    end
  end
end
