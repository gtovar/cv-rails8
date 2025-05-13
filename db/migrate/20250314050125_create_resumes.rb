class CreateResumes < ActiveRecord::Migration[8.0]
  def change
    create_table :resumes do |t|
      t.references :user, null: false, foreign_key: true

      t.string :title, null: false                     # Ej: Gilberto Tovar
      t.string :subtitle                               # Ej: Ruby on Rails Developer
      t.text   :summary                                # Descripción breve

      t.timestamps
    end
  end
end

