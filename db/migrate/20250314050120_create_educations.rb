class CreateEducations < ActiveRecord::Migration[8.0]
  def change
    create_table :educations do |t|
      t.string :institution
      t.string :degree
      t.date :start_date
      t.date :end_date
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
