class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :title, null: false
      t.text :biography

      t.timestamps null: false
    end
  end
end
