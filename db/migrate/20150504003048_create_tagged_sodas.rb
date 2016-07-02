class CreateTaggedSodas < ActiveRecord::Migration
  def change
    create_table :tagged_sodas do |t|
      t.references :tag, index: true
      t.references :soda, index: true

      t.timestamps null: false
    end
    add_foreign_key :tagged_sodas, :tags
    add_foreign_key :tagged_sodas, :sodas
  end
end
