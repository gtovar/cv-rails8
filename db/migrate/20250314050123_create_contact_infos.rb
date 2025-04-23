class CreateContactInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_infos do |t|
      t.string :email
      t.string :phone
      t.text :address
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
