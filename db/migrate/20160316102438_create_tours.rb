class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.text :description
      t.timestamps null: false
    end
  end
end
