class CreateContactInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_infos do |t|
      t.string :kind, null: false         # Ej: "email", "phone", "linkedin", "github"
      t.string :value, null: false        # Ej: "gil@example.com", "https://github.com/giltovar"
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end

    add_index :contact_infos, [ :resume_id, :kind ], unique: true
  end
end
