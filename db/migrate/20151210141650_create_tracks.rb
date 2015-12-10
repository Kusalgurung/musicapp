class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.belongs_to :album, index: true, foreign_key: true
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
