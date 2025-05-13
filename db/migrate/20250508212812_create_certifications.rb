class CreateCertifications < ActiveRecord::Migration[8.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :institution
      t.date :issue_date
      t.date :expiration_date
      t.string :credential_url
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
