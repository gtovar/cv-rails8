class CreateExperiences < ActiveRecord::Migration[8.0]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :role
      t.date :start_date
      t.date :end_date
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
