class CreateSkills < ActiveRecord::Migration[8.0]
  def change
    create_table :skills do |t|
      t.string  :name, null: false              # Ej: "Ruby"
      t.string  :level                          # Ej: "Avanzado", "Intermedio"
      t.string  :category                       # Ej: "Backend", "DevOps", "Soft Skill"
      t.text    :description                    # Texto adicional para mostrar en la vista

      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
