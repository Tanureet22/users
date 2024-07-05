class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :rating
      t.integer :time_period
      t.string :country_spoken
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
