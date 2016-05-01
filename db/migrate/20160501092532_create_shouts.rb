class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :content_id
      t.string :content_type
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :shouts, [:content_id, :content_type]
  end
end
