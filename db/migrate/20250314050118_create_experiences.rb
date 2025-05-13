class CreateExperiences < ActiveRecord::Migration[8.0]
  def change
    create_table :experiences do |t|
      t.string  :company, null: false            # Ej: Konsigue
      t.string  :position, null: false           # Ej: Desarrollador Backend
      t.date    :start_date, null: false
      t.date    :end_date

      t.text    :description                     # Resumen narrativo general
      t.text    :activities                      # Tareas principales realizadas
      t.text    :achievements                    # Logros destacables
      t.text    :tools                           # Tecnologías utilizadas

      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
