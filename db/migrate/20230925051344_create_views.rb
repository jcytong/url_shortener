class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.belongs_to :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
